#!/usr/bin/env python3
import RPi.GPIO as GPIO
import time
import os

BreachPin = 17

#Initialize GPIO
def setup():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(BreachPin, GPIO.IN)    # Set BreachPin as input

#Handler to take Picture when BreachPin goes high and save to "Burglar.jpg"
def takePicture(ev=None):
    os.system("fswebcam Burglar.jpg")

#Initialize Edge-Triggered Interrupt
def loop():
	GPIO.add_event_detect(BreachPin, GPIO.RISING, callback=takePicture, bouncetime=200) #Trigger Interrupt on every Positive Edge of a Breach, debounced
	while True:
		time.sleep(1)   # Don't do anything

def destroy():
	GPIO.cleanup()                     # Release resource

if __name__ == '__main__':     # Program start from here
	setup()
	try:
		loop()
	except KeyboardInterrupt:  # When 'Ctrl+C' is pressed, the child program destroy() will be  executed.
		destroy()

