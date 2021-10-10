#!/usr/bin/env python
from flask import Flask, render_template, Response
import cv2
import numpy as np
import sys
import cgi
import cgitb

#Initialize the Flask app
app = Flask(__name__, template_folder='/www/pages')
camera = cv2.VideoCapture(0)
camera.set(cv2.CAP_PROP_FRAME_WIDTH, 800)
camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 600)
camera.set(cv2.CAP_PROP_FPS, 24)
camera.set(cv2.CAP_PROP_BRIGHTNESS , 130)

quality = 100;
encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), quality]
v1 = 0

def gen_frames():  
	while True:
		success, frame = camera.read()
		faceCascade = cv2.CascadeClassifier('/www/pages/haarcascades/haarcascade_frontalface_default.xml')
		eye_cascade = cv2.CascadeClassifier('/www/pages/haarcascades/haarcascade_eye.xml')
		
		frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
		contrast = 1.25
		brightness = 10
		# Hue
		frame[:,:,0] = np.clip(1.0 * frame[:,:,0] + 0, 0, 255)
		# Saturation
		frame[:,:,1] = np.clip(1.0 * frame[:,:,1] + 0, 0, 255)
		# Value
		frame[:,:,2] = np.clip(contrast * frame[:,:,2] + brightness, 0, 255)
		frame = cv2.cvtColor(frame, cv2.COLOR_HSV2BGR)
		
		# Detect faces in the image
		gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		faces = faceCascade.detectMultiScale(gray)
		for (x,y,w,h) in faces:
			cv2.rectangle(frame,(x,y),(x+w,y+h),(255,0,0),2)
			roi_gray = gray[y:y+h, x:x+w]
			roi_color = frame[y:y+h, x:x+w]
			
			eyes = eye_cascade.detectMultiScale(roi_gray)
			for (ex,ey,ew,eh) in eyes:
				cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)

		if not success:
			break
		else:	
			ret, buffer = cv2.imencode('.jpg', frame, encode_param)
			frame = buffer.tobytes()
			yield (b'--frame\r\n'
				b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n') 
				
def get_catch(img_counter): 
	catch_ok = True
	while catch_ok:
		success, frame = camera.read()
		if not success:
			break
		else:
			img_name = "opencv_frame_{}.png".format(img_counter)
			cv2.imwrite(img_name, frame)
			print("{} written!".format(img_name))
			ret, buffer = cv2.imencode('.jpg', frame, encode_param)
			frame = buffer.tobytes()
			catch_ok = False
			yield (b'--frame\r\n'
				b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
				
                                         
@app.route('/video_feed')
def video_feed():
	return Response(gen_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/video')
def video():
	return render_template("camera.html")

@app.route('/catch.py')
def catch(): 
	return render_template("catch.html")
	
@app.route('/catch_feed')
def catch_feed():
	global v1
	v1 += 1
	return Response(get_catch(v1), mimetype='multipart/x-mixed-replace; boundary=frame')
	
if __name__ == "__main__":
	#app.run(host='192.168.1.181', port=5000)
	app.run(host='10.14.9.165', port=5000)

