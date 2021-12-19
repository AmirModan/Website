#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/sysctl.h"
#include "driverlib/adc.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "inc/tm4c123gh6pm.h"
#include "Temperature.h"

//*****************************************************************************
//
//! In this project we use ADC0, SS3 to measure the data from Pin PE3 
//! of the microcontroller. The ADC sampling is triggered by software at a 
//! frequency of 1000Hz. Both the Celsius and the Fahreheit 
//! temperatures are calcuated.
//
//*****************************************************************************


//ADC0 initializaiton
void ADC_Init(void)
{
		SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);
	
		SysCtlDelay(2);
	
		ADCSequenceDisable(ADC0_BASE, 3); //disable ADC0 before the configuration is complete
		ADCSequenceConfigure(ADC0_BASE, 3, ADC_TRIGGER_PROCESSOR, 0); // will use ADC0, SS3, processor-trigger, priority 0
		
		//ADC0 SS3 Step 0, sample from Pin PE3, completion of this step will set RIS, last sample of the sequence
		ADCSequenceStepConfigure(ADC0_BASE, 3,0,ADC_CTL_TS|ADC_CTL_IE|ADC_CTL_END); 
	
		IntPrioritySet(INT_ADC0SS3, 0x00);  	 // configure ADC0 SS3 interrupt priority as 0
		IntEnable(INT_ADC0SS3);    				// enable interrupt 31 in NVIC (ADC0 SS3)
		ADCIntEnableEx(ADC0_BASE, ADC_INT_SS3);      // arm interrupt of ADC0 SS3
		ADCSequenceEnable(ADC0_BASE, 3); //enable ADC0
}



