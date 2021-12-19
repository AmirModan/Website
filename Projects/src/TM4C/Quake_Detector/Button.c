#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_gpio.h"
#include "driverlib/sysctl.h"
#include "driverlib/pin_map.h"
#include "driverlib/gpio.h"
#include "inc/tm4c123gh6pm.h"
#include "driverlib/interrupt.h"

void D_Interrupt_Init(void)
{
  IntEnable(INT_GPIOD); 		 			 		// enable interrupt 1 in NVIC (GPIOD)
	IntPrioritySet(INT_GPIOD, 0x02); 		// configure GPIOD interrupt priority as 1
	GPIO_PORTD_IM_R |= 0x0E;   					// arm interrupt on PD3
	GPIO_PORTD_IS_R &= ~0x0E;			     	// PD3 is edge-sensitive
	GPIO_PORTD_IBE_R |= 0x0E;   				// PD3 both edges trigger 
}