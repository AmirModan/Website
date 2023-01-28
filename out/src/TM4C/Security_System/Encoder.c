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
#include "driverlib/qei.h"

int flag = 0;

// Initialize Encoder
void QEI_Init()
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_QEI0);
  SYSCTL_RCGCQEI_R |= 0x01;       // QEI run mode clock gating control on
  SYSCTL_RCGCGPIO_R |= 0x08;      //Enable clock for PORTD
     
  GPIO_PORTD_LOCK_R = 0x4C4F434B; //Unlock port D for changes
  GPIO_PORTD_CR_R |= 0xC8;        // Allow changes to PD3,6,7      
	GPIO_PORTD_AMSEL_R &= 0x00;     // Disable analog function
  GPIO_PORTD_DEN_R |= 0xC8;       // Enable Digital Pins
  GPIO_PORTD_DIR_R &= ~0xC8;  		// Configure direction of pins as Input
  GPIO_PORTD_AFSEL_R |= 0xC8;     // QEI alternate function on PD3,6,7
	GPIO_PORTD_PCTL_R = (GPIO_PORTD_PCTL_R&0x00FF0FFF)+0x66006000; 
  // Set PCTL Register PMC7, PMC6, PMC3 to 0x06  
     
  NVIC_PRI3_R = (NVIC_PRI3_R&0xFFFF1FFF)|0xA000; //QEI 0 Interrupt priority set to 5
  NVIC_EN0_R |= 0x2000;                          //Enable QEI 0 Interrupt
     
  QEI0_CTL_R |= 0x38; 
  QEI0_INTEN_R |= 0x08;             //Enable the Phase error interrupt
  QEI0_LOAD_R = 0x00001387;         //Velocity timer value 5000 - 1
  QEI0_MAXPOS_R = ((1024 * 4) - 1); //Maximum Position Value 
  QEI0_CTL_R |= 0x01;               //Enable QEI
		
	//Unlock GPIOD7
	HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
	HWREG(GPIO_PORTD_BASE + GPIO_O_CR) |= 0x80;
	HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = 0;


	//Set GPIO pins for QEI
	GPIOPinTypeQEI(GPIO_PORTD_BASE, GPIO_PIN_6 |  GPIO_PIN_7);

	//Disable peripheral and interrupt before configuration
	QEIDisable(QEI0_BASE);
	QEIIntDisable(QEI0_BASE,QEI_INTERROR | QEI_INTDIR | QEI_INTTIMER | QEI_INTINDEX);

	// Configure quadrature encoder
	QEIConfigure(QEI0_BASE, (QEI_CONFIG_CAPTURE_A_B  | QEI_CONFIG_RESET_IDX 	| QEI_CONFIG_QUADRATURE | QEI_CONFIG_NO_SWAP), 1000);
	// Enable quadrature encoder.
	QEIEnable(QEI0_BASE);

	//Set position to a middle value
	QEIPositionSet(QEI0_BASE, 500);
}
 
//Handles Phase Error Interrupt
void Quadrature0_Handler(void)
{
    IntGlobalDisable();   	//Disable interrupts
    if((QEI0_RIS_R&0x08))  	//Check if the interrupt is caused by a Phase Error
    {
        flag = 1; //Set a flag to indicate a phase error
        QEI0_ISC_R |= 0x08; //Clear the interrupt trigger
    }
}
