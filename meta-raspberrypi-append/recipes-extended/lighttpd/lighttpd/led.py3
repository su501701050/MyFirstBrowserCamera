#!/usr/bin/env python3

import RPi.GPIO as GPIO # RPi.GPIOモジュールを使用
import time

# LEDとスイッチのGPIO番号
# デフォルトはRPZ-IR-Sensorの緑LEDと赤SW
# 必要に応じて変更
gpio_led = 17
gpio_sw = 5

# GPIO番号指定の準備
GPIO.setmode(GPIO.BCM)

# LEDピンを出力に設定
GPIO.setup(gpio_led, GPIO.OUT)

# スイッチピンを入力、プルアップに設定
GPIO.setup(gpio_sw, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# スイッチの状態を取得
sw = GPIO.input(gpio_sw)

# スイッチが押されていた場合(ON)
if 0==sw:
    GPIO.output(gpio_led, 1)    # LED点灯
    time.sleep(5)               # 5秒待機
    GPIO.output(gpio_led, 0)    # LED消灯

# スイッチが離されていた場合(OFF)
else:
    GPIO.output(gpio_led, 1)    # LED点灯
    time.sleep(1)               # 1秒待機
    GPIO.output(gpio_led, 0)    # LED消灯

# 後処理 GPIOを解放
GPIO.cleanup(gpio_led)
GPIO.cleanup(gpio_sw)
