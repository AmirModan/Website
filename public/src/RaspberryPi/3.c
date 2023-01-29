#include <wiringPi.h>
#include <softPwm.h>
#include <stdio.h>

#define ButtonPin 26

//make led_n on
void led_on(int n)
{
	softPwmWrite(n, 0);
}

//make led_n off
void led_off(int n)
{
	softPwmWrite(n, 100);
}

int isValid(int n)
{
	if(n > 100){
		return 0;
	}
	return n;
}

void seperateRPwmWrite(int m, int n)
{
	n += m * 10;
	softPwmWrite(7 - m,isValid(n));
}

void seperateLPwmWrite(int m, int n)
{
	n += m * 10;
	softPwmWrite(m,isValid(n));
}

void seperateIPwmWrite(int m, int n)
{
	n += m * 10;
	softPwmWrite(4 + m,isValid(n));
	softPwmWrite(3 - m,isValid(n));
}

void seperateOPwmWrite(int m, int n)
{
	n += m * 10;
	softPwmWrite(m,isValid(n));
	softPwmWrite(7 - m,isValid(n));
}

int main(void)
{
	int i, j;
	int setting = 15;

	if(wiringPiSetup() == -1){ //when initialize wiring failed,print messageto screen
		printf("setup wiringPi failed !");
		return 1; 
	}

	for(i=0;i<8;i++){
		printf("linker LedPin : GPIO %d(wiringPi pin)\n",i); //when initialize wiring successfully,print message to screen
	}

	pinMode(ButtonPin, INPUT);
	pullUpDnControl(ButtonPin, PUD_UP);  //pull up to 3.3V,make GPIO1 a stable level

	for(i=0;i<8;i++){ //make 8 pins' mode is output
		pinMode(i, OUTPUT);
	}

	for(i=0;i<8;i++){
		softPwmCreate(i, 0, 100);
	}

	while(1){

		switch(setting){

			case 0:
				for(i=0;i<8;i++){
					led_off(i);
				}
				while(setting == 0){
					if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
					}	
				}

			case 1:
				while(setting == 1){
					for(i=0;i<8;i++){   //make led on from left to right
						led_on(i);
						delay(100);
						led_off(i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}

				}

			case 2:
				while(setting == 2){
					for(i=7;i>=0;i--){  //make led off from right to left
						led_on(i);
						delay(100);
						led_off(i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 3:
				while(setting == 3){
					for(i=0;i<8;i++){   //make led on from left to right
						led_on(i);
						delay(100);
						led_off(i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
					if(setting != 3){
						continue;
					}

					for(i=7;i>=0;i--){  //make led off from right to left
						led_on(i);
						delay(100);
						led_off(i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 4:
				while(setting == 4){
					for(i=0;i<=3;i++){
						led_on(4+i);
						led_on(3-i);
						delay(100);
						led_off(4+i);
						led_off(3-i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 5:
				while(setting == 5){
					for(i=3;i>=0;i--){
						led_on(4+i);
						led_on(3-i);
						delay(100);
						led_off(4+i);
						led_off(3-i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 6:
				while(setting == 6){
					for(i=0;i<=3;i++){  //make led off from right to left
						led_on(4+i);
						led_on(3-i);
						delay(100);
						led_off(4+i);
						led_off(3-i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}

					if(setting != 6){
						continue;
					}

					for(i=3;i>=0;i--){
						led_on(4+i);
						led_on(3-i);
						delay(100);
						led_off(4+i);
						led_off(3-i);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 7:
				for(i=0;i<8;i++){
						led_on(i);
				}
				while(setting == 7){
					if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
					}	
				}

			case 8:
				for(i=0;i<8;i++){
					led_off(i);
				}
				while(setting == 8){
					if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
					}	
				}

			case 9:
				while(setting == 9){
					for(j=0;j<=100;j++){
						for(i=0;i<8;i++){
							softPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
					if(setting != 9){
						continue;
					}
					delay(20);
					for(j=100;j>=0;j--){
						for(i=0;i<8;i++){
							softPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}

				}

			case 10:
				while(setting == 10){
					for(j=0;j<=100;j+=2){
						for(i=0;i<8;i++){
							seperateRPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 11:
				while(setting == 11){
					for(j=0;j<=100;j+=2){
						for(i=0;i<8;i++){
							seperateLPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 12:
				while(setting == 12){
					for(j=0;j<=100;j+=2){
						for(i=0;i<8;i++){
							seperateRPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting = 0;
							delay(500);
							continue;
						}
					}
					for(j=0;j<=100;j+=2){
						for(i=0;i<8;i++){
							seperateLPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 13:
				while(setting == 13){
					for(j=0;j<=100;j+=2){
						for(i=0;i<4;i++){
							seperateIPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 14:
				while(setting == 14){
					for(j=0;j<=100;j+=2){
						for(i=0;i<4;i++){
							seperateOPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting++;
							delay(500);
							continue;
						}
					}
				}

			case 15:
				while(setting == 15){
					for(j=0;j<=100;j+=2){
						for(i=0;i<4;i++){
							seperateIPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting = 0;
							delay(500);
							continue;
						}
					}

					for(j=0;j<=100;j+=2){
						for(i=0;i<4;i++){
							seperateOPwmWrite(i, j);
						}
						delay(20);
						if(digitalRead(ButtonPin) == 0){ //indicate that button has pressed down
							setting = 0;
							delay(500);
							continue;
						}
					}
				}
		}

	}

	return 0;
}

