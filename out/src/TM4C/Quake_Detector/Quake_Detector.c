#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_gpio.h"
#include "inc/tm4c123gh6pm.h"
#include "driverlib/sysctl.h"
#include "driverlib/pin_map.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/qei.h"
#include "driverlib/timer.h"
#include "driverlib/adc.h"
#include "driverlib/hibernate.h"
#include "uartstdio.h"
#include "Button.h"
#include "Encoder.h"
#include "Accelerometer.h"
#include "LCD.h"
#include "PWM.h"
#include "Temperature.h"


volatile int qeiPosition;
volatile int qeiPositionNew;
volatile int qeiPositionOld;

int xForce, yForce, zForce, timeout, breach;
int sumX = 0;
int sumADX = 0;
int sumY = 0;
int sumADY = 0;
int sumZ = 0;
int sumADZ = 0;
int displayCount = 0;
int sleepCount = 0;
uint8_t flags = 0;

//See ADXL345 Datasheet for register addresses
#define SLAVE_ADDRESS 0x53
#define ID 0x00
#define P_MODE 0x3f
#define P_SETTINGS 0x2d
#define X_AXIS 0
#define DATA_X0 0x32
#define DATA_X1 0x33
#define Y_AXIS 1
#define DATA_Y0 0x34
#define DATA_Y1 0x35
#define Z_AXIS 2
#define DATA_Z0 0x36
#define DATA_Z1 0x37

//Motion Thresholds
#define XSENSITIVITY 70
#define YSENSITIVITY 70
#define ZSENSITIVITY 70

// Window Size
#define WINDOW_SIZE 200

// Default Thresholds
int quake_threshold = 100;
int temp_threshold = 30;

// Queue of motion vectors
int queueX [WINDOW_SIZE] = {0};
int queueY [WINDOW_SIZE] = {0};
int queueZ [WINDOW_SIZE] = {0};
int queueIndex = 0;

// Temperature
uint32_t ui32ADC0Value;
volatile int32_t temp;

//*****************************************************************************
void
PortFunctionInit(void)
{
	
	// Sets the clock to 40MHz
	SysCtlClockSet(SYSCTL_SYSDIV_5|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
	
	ADC_Init(); // Initialize ADC0 SS3 Interrupt
	
  // Enable Peripheral Clocks 
	SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOB | SYSCTL_RCGC2_GPIOC | SYSCTL_RCGC2_GPIOD | SYSCTL_RCGC2_GPIOE | SYSCTL_RCGC2_GPIOF | SYSCTL_RCGC0_ADC0;
  
  // Enable pin PD1-2 for GPIOInput
  GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_1 | GPIO_PIN_2);
	
  // Enable pins PB0-6 for GPIOOutput
  GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6);
	
  // Enable pin PF1 for GPIOOutput
  GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1);
	
	// Instantiate Hiberantion Module
	SysCtlPeripheralEnable(SYSCTL_PERIPH_HIBERNATE);
	HibernateEnableExpClk(SysCtlClockGet());
	// Retain GPIO signals
	HibernateGPIORetentionEnable();
	
	// Set Real-Time Clock
	HibernateRTCSet(0);
	HibernateRTCEnable();
	// Awake after 5 seconds
	HibernateRTCMatchSet(0,5);
	
	// Awake from Real-Time Clock or SW2
	HibernateWakeSet(HIBERNATE_WAKE_PIN | HIBERNATE_WAKE_RTC);

}

//Globally enable interrupts 
void IntGlobalEnable(void)
{
    __asm("    cpsie   i\n");
}

//Globally disable interrupts 
void IntGlobalDisable(void)
{
    __asm("    cpsid   i\n");
}



int main(void)
{
	
	//initialize the GPIO ports	
	PortFunctionInit();
	//configure the GPIOD interrupt
	D_Interrupt_Init();
	//Initialize quadrature encoder interface
	QEI_Init();
	//initialize Timer0A and configure the interrupt
	Timer0A_Init(SysCtlClockGet()/20);
	// globally enable interrupt
	IntGlobalEnable();
	//Initialize I2C Interface
	I2C_Init();
	//Initialize UART Interface
  InitConsole();
	//Initialize the LCD module with blinking cursor
	LCD_Init(off_crs);
	// Initialize PWM module
	PWM_Init();
	
	
  // Configure Power Settings on Accelerometer
  writeProcess(SLAVE_ADDRESS, P_SETTINGS, P_MODE);

	// Set Reference Position of Encoder
	qeiPositionOld = QEIPositionGet(QEI0_BASE);
	while (1) //This is the main loop of the program
	{
			//Get current Encoder Position
			qeiPositionNew = QEIPositionGet(QEI0_BASE);
			
			//Compare current position to reference
			if((qeiPositionNew > qeiPositionOld) || (qeiPositionNew < qeiPositionOld))
			{
				switch (flags & 0x1) {
						case 0:
							//(In/De)crement Quake Threshold depending on direction
							quake_threshold += QEIDirectionGet(QEI0_BASE) * 10;
							//Print motion vector
							UARTprintf("%d\n", quake_threshold);
							
							break;
						case 1:
							//(In/De)crement Quake Threshold depending on direction
							temp_threshold += QEIDirectionGet(QEI0_BASE);
							//Print motion vector
							UARTprintf("%d\n", temp_threshold);
							break;
					
				}
				// Update Encoder position
				qeiPositionOld = qeiPositionNew;
				
			}
			//Eliminate Encoder Signal Bounce
			//SysCtlDelay(SysCtlClockGet()/20);
	}
}

//interrupt handler
void GPIOPortD_Handler(void)
{
	//PD3 has action
	if(GPIO_PORTD_RIS_R&0x08)
	{
		// acknowledge flag for PD3
		GPIO_PORTD_ICR_R |= 0x08; 
		
		//PD3 is pressed
		if((GPIO_PORTD_DATA_R&0x08)==0x08) 
		{
			//Switches between Seismic Activity and Temperature Mode
			flags ^= 0x01;
		}
	}
}

//interrupt handler for Timer0A
void Timer0A_Handler(void)
{
	// acknowledge flag for Timer0A timeout
	TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	//Determine Current Motion Vectors
	xForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_X0), readProcess(SLAVE_ADDRESS, DATA_X1));
	yForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_Y0), readProcess(SLAVE_ADDRESS, DATA_Y1));
	zForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_Z0), readProcess(SLAVE_ADDRESS, DATA_Z1));
	ADCProcessorTrigger(ADC0_BASE, 3); // Generate a Processor Trigger for ADC Sequence SS3
	
	// Update Sliding Window
	sumADX -= abs(queueX[queueIndex] - (sumX/WINDOW_SIZE));
	sumX -= queueX[queueIndex];
	queueX[queueIndex] = xForce;
	sumX += queueX[queueIndex];
	sumADX += abs(queueX[queueIndex] - (sumX/WINDOW_SIZE));
	
	sumADY -= abs(queueY[queueIndex] - (sumY/WINDOW_SIZE));
	sumY -= queueY[queueIndex];
	queueY[queueIndex] = yForce;
	sumY += queueY[queueIndex];
	sumADY += abs(queueY[queueIndex] - (sumY/WINDOW_SIZE));
	
	sumADZ -= abs(queueZ[queueIndex] - (sumZ/WINDOW_SIZE));
	sumZ -= queueZ[queueIndex];
	queueZ[queueIndex] = zForce;
	sumZ += queueZ[queueIndex];
	sumADZ += abs(queueZ[queueIndex] - (sumZ/WINDOW_SIZE));
	
	// Update Index
	queueIndex++;
	queueIndex%=WINDOW_SIZE;
	
	// Calculate sum of Mean Absolute Deviations
	int mad = abs(sumADX + sumADY + sumADZ) / (3*WINDOW_SIZE);
	
	// Update LCD Screen every 10 samples
	if(!(displayCount % 10)) {
		// Clear LCD
		LCD_clrscr();
		switch (flags & 0x1) {
			// Seismic Activity Mode
			case 0:
				LCD_goto(0,0);
				LCD_puts("Seismic Activity");
				LCD_goto(0,1);
				LCD_puti(quake_threshold);
				LCD_goto(7,1);
				if (quake_threshold > mad)
					LCD_putc('>');
				else if(quake_threshold < mad)
					LCD_putc('<');
				else
					LCD_putc('=');
				LCD_goto(11,1);
				LCD_puti(mad);
			
				UARTprintf("mad = %d\n", mad);
				
				// Update PWM Indication of Temperature
				Update_PWM((temp - (temp_threshold/2))*1024/temp_threshold, temp>temp_threshold/2 ? (temp_threshold - temp)*1024/temp_threshold : temp*1024/temp_threshold, (temp_threshold/2 - temp)*1024/temp_threshold);
				break;
			// Temperature Mode
			case 1:
				LCD_goto(0,0);
				LCD_puts("Internal Temp.  ");
				LCD_goto(0,1);
				LCD_puti(temp_threshold);
				LCD_putc('C');
				LCD_goto(7,1);
				if (temp_threshold > temp)
					LCD_putc('>');
				else if(temp_threshold < mad)
					LCD_putc('<');
				else
					LCD_putc('=');
				LCD_goto(11,1);
				LCD_puti(temp);
				LCD_putc('C');
			
				UARTprintf("Temp. = %d\n", temp);
				
				// Update PWM Indication of Seismic Activity
				Update_PWM((mad - (quake_threshold/2))*1024/quake_threshold, mad>quake_threshold/2 ? (quake_threshold - mad)*1024/quake_threshold : mad*1024/quake_threshold, (quake_threshold/2 - mad)*1024/quake_threshold);
				break;
		}
	}
	displayCount++;
	
	// Overheating Detected
	if (temp > temp_threshold) {
			LCD_goto(0,0);
			LCD_puts("System Overheat!");
			UARTprintf("System Overheat");
			LCD_goto(0,1);
			LCD_puti(temp_threshold);
			LCD_putc('C');
			LCD_goto(7,1);
			LCD_putc('<');
			LCD_goto(11,1);
			LCD_puti(temp);
			LCD_putc('C');
			HibernateRequest();
			while(1) {}
	} 
	// Quake Detected
	else if(mad > quake_threshold) {
			// Quake Detected
			LCD_goto(0,0);
			LCD_puts("Quake Detected! ");
			UARTprintf("Quake Detected");
			LCD_goto(0,1);
			LCD_puti(quake_threshold);
			LCD_goto(7,1);
			LCD_putc('<');
			LCD_goto(11,1);
			LCD_puti(mad);
	}
}

//interrupt handler for ADC0
void ADC_Handler(void)
{
	ADCIntClear(ADC0_BASE, 3); // Initialize ADC0 SS3 Interrupt
	ADCSequenceDataGet(ADC0_BASE, 3, &ui32ADC0Value); // Get Data from ADC Sequence SS3
	temp = (1475 - ((2475 * ui32ADC0Value)) / 4096)/10; // Calculate Temperature in Celsius with VREFP = 3.3V, VREFN = 0V
}
