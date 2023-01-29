

#include <stdint.h>
#include "TM4C123GH6PM.h"
#include "delay.h"


void delay_ms(uint32_t delay){
		for(;delay>0;--delay){
		SysTick->LOAD=load_val-calib_m;
		SysTick->CTRL|=0x5;
		while((SysTick->CTRL&(1<<16))==0);
		}
		SysTick->CTRL=0;
}


