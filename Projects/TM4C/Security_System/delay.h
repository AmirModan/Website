/* This header file uses systick timer for generating accurate delay in ms*/


#ifndef          delay_H
#define          delay_H

#define 					XTAL						16000000         //CPU frequancy 
#define					load_val				(XTAL/1000)
#define					calib_m  					1	   //

#include <stdint.h>

extern void delay_ms(uint32_t delay);

#endif  //delay_H
