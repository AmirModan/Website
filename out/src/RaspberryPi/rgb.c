#include <wiringPi.h>
#include <softPwm.h>
#include <stdio.h>

#define uchar unsigned char

#define LedPinRed    27
#define LedPinGreen  28
#define LedPinBlue   29

void ledInit(void)
{
	softPwmCreate(LedPinRed,  0, 100);
	softPwmCreate(LedPinGreen,0, 100);
	softPwmCreate(LedPinBlue, 0, 100);
}

void ledColorSet(uchar r_val, uchar g_val, uchar b_val)
{
	softPwmWrite(LedPinRed,   r_val);
	softPwmWrite(LedPinGreen, g_val);
	softPwmWrite(LedPinBlue,  b_val);
}

int main(void)
{

	if(wiringPiSetup() == -1){ //when initialize wiring failed,print messageto screen
		printf("setup wiringPi failed !");
		return 1; 
	}
	//printf("linker LedPin : GPIO %d(wiringPi pin)\n",LedPin); //when initialize wiring successfully,print message to screen

	ledInit();

	while(1){

		for(int i = 255; i >= 0; i--) {
			ledColorSet(0, i, 255);
			delay(10);
		}

		for(int i = 0; i <= 255; i++) {
			ledColorSet(i, 0, 255);
			delay(10);
		}

		for(int i = 255; i >= 0; i--) {
			ledColorSet(255, 0, i);
			delay(10);
		}

		for(int i = 0; i <= 255; i++) {
			ledColorSet(255, i, 0);
			delay(10);
		}

		for(int i = 255; i >= 0; i--) {
			ledColorSet(i, 255, 0);
			delay(10);
		}

		for(int i = 0; i <= 255; i++) {
			ledColorSet(0, 255, i);
			delay(10);
		}
		
	}

	return 0;
}
