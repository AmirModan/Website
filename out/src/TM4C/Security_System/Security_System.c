#include <stdint.h>
#include <stdbool.h>
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
#include "utils/uartstdio.h"
#include "Button.h"
#include "Encoder.h"
#include "Accelerometer.h"
#include "LCD.h"


volatile int qeiPosition;
volatile int qeiPositionNew;
volatile int qeiPositionOld;

int xForce, yForce, zForce, timeout, breach;
char password[] = "ABCD            ";
char input[] = "                ";
int indx;
char c;
bool entered, correct, breached;

#define BREACH 	0x01

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

//*****************************************************************************
void
PortFunctionInit(void)
{
	
	// Sets the clock to 40MHz
	SysCtlClockSet(SYSCTL_SYSDIV_5|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
	
  // Enable Peripheral Clocks 
	SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOB | SYSCTL_RCGC2_GPIOC | SYSCTL_RCGC2_GPIOD | SYSCTL_RCGC2_GPIOE | SYSCTL_RCGC2_GPIOF;
  
  // Enable pin PD1-2 for GPIOInput
  GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_1 | GPIO_PIN_2);
	
  // Enable pins PB0-6 for GPIOOutput
  GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6);

  // Enable pin PF1 for GPIOOutput
  GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1);
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
	Timer0A_Init(SysCtlClockGet());
	// globally enable interrupt
	IntGlobalEnable();
	//Initialize I2C Interface
	I2C_Init();
	//Initialize UART Interface
  InitConsole();
	//Initialize the LCD module with blinking cursor
	LCD_Init(blnk_crs);
	
  // Configure Power Settings on Accelerometer
  writeProcess(SLAVE_ADDRESS, P_SETTINGS, P_MODE);

	// Set Reference Position of Encoder
	qeiPositionOld = QEIPositionGet(QEI0_BASE);
	
	while (1) //This is the main loop of the program
	{
		//Determine Current Motion Vectors
		xForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_X0), readProcess(SLAVE_ADDRESS, DATA_X1));
		yForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_Y0), readProcess(SLAVE_ADDRESS, DATA_Y1));
		zForce = conjoin(readProcess(SLAVE_ADDRESS, DATA_Z0), readProcess(SLAVE_ADDRESS, DATA_Z1));
		
		//Reset System
		indx = 0;
		c = 'A';
		for(int i = 0; i < sizeof(input); i++)
			input[i] = ' ';
		entered = false;
		correct = true;
		breached = false;
		GPIO_PORTB_DATA_R &= ~BREACH;
		breach = (GPIO_PORTB_DATA_R & BREACH);
		GPIO_PORTF_DATA_R &= ~0x02;
		
		//Prompt User for Password
		UARTprintf("Enter Password:\n\r");
		LCD_clrscr();
		LCD_puts("Enter Password:\n");
		//Display Character
		UARTprintf("%c\b", c);
		LCD_putc(c);
		LCD_putc('\b');
		
		//Keep checking for character selection
		while(!entered && indx < sizeof(input) && !breached)
		{
			//Get current Encoder Position
			qeiPositionNew = QEIPositionGet(QEI0_BASE);
			
			//Compare current position to reference
			if((qeiPositionNew > qeiPositionOld) || (qeiPositionNew < qeiPositionOld))
			{
				//(In/De)crement Character depending on direction
				c += QEIDirectionGet(QEI0_BASE);
				if(c < 'A')
					c = 'z';
				else if(c > 'z')
					c = 'A';
				qeiPositionOld = qeiPositionNew;
				//Print New Character
				UARTprintf("%c\b", c);
				LCD_putc(c);
				LCD_putc('\b');
			}
			//Eliminate Encoder Signal Bounce
			SysCtlDelay(SysCtlClockGet()/5);
		}
		
		//Compare Password Buffer to Correct Password
		for(int i = 0; i < sizeof(password)-1 && !breached; i++)
			//Report Character Comparisons and check for correctness
			if(password[i] != input[i])
			{
				UARTprintf(" ,\'%c\'!=\'%c\'", password[i], input[i]);
				correct = false;
			}
			else
			{
				UARTprintf(" ,\'%c\'=\'%c\'", password[i], input[i]);
			}
		//Clear Password Screen
		LCD_clrscr();
			
		//Initiate Security Response
		if(breached)
		{
			GPIO_PORTB_DATA_R |= BREACH;
			breach = (GPIO_PORTB_DATA_R & BREACH);
			UARTprintf("\nSecurity Breach!\n\r");
			LCD_puts("\nSecurity Breach!\n");
			//Delay for 30 Seconds
			for(timeout = 100; timeout > 0; timeout--)
			{
				GPIO_PORTF_DATA_R ^= 0x02;
				SysCtlDelay(SysCtlClockGet()/10);
			}
			//Toggle Red LED
			GPIO_PORTF_DATA_R &= ~0x02;
		}
		//Disable System for 30 Seconds
		else if(correct)
		{
			UARTprintf("\n\rCorrect\n\r");
			LCD_puts("\nCorrect\n");
			SysCtlDelay(SysCtlClockGet()*10);
		}
		//Report Incorrect Password
		else
		{
			UARTprintf("\n\rIncorrect\n\r");
			LCD_puts("\nIncorrect\n");
		}
		UARTprintf("Breach = %d\n", breach);
		SysCtlDelay(SysCtlClockGet());
	}
}

//interrupt handler
void GPIOPortD_Handler(void)
{
	//switch debounce
	IntDisable(INT_GPIOD); 
	SysCtlDelay(53333);	// Delay for a while
	IntEnable(INT_GPIOD);
	
	//PD1 has action
	if(GPIO_PORTD_RIS_R&0x02)
	{
		// acknowledge flag for PD1
		GPIO_PORTD_ICR_R |= 0x02;
		
		//PD1 is pressed
		if((GPIO_PORTD_DATA_R&0x02)==0x02) 
		{
			//Delete last character if present
			if(indx > 0)
			{
				input[indx] = ' ';
				indx--;
				UARTprintf("\b");
				LCD_puts(" \b\b");
			}
		}
	}
	
	//PD2 has action
	if(GPIO_PORTD_RIS_R&0x04)
	{
		// acknowledge flag for PD2
		GPIO_PORTD_ICR_R |= 0x04; 
		
		//PD2 is pressed
		if((GPIO_PORTD_DATA_R&0x04)==0x04) 
		{
			//Set current indexed input to selected character
			input[indx] = c;
			indx++;
			UARTprintf("%c", c);
			LCD_putc(c);
			
		}
	}
	
	//PD3 has action
	if(GPIO_PORTD_RIS_R&0x08)
	{
		// acknowledge flag for PD3
		GPIO_PORTD_ICR_R |= 0x08; 
		
		//PD3 is pressed
		if((GPIO_PORTD_DATA_R&0x08)==0x08) 
		{
			//Enters and validates Password
			entered = true;
		}
	}
}

//interrupt handler for Timer0A
void Timer0A_Handler(void)
{
	// acknowledge flag for Timer0A timeout
	TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	//Sample Motion Vectors
	int xForceCurrent = conjoin(readProcess(SLAVE_ADDRESS, DATA_X0), readProcess(SLAVE_ADDRESS, DATA_X1));
	int yForceCurrent = conjoin(readProcess(SLAVE_ADDRESS, DATA_Y0), readProcess(SLAVE_ADDRESS, DATA_Y1));
	int zForceCurrent = conjoin(readProcess(SLAVE_ADDRESS, DATA_Z0), readProcess(SLAVE_ADDRESS, DATA_Z1));
	//Set Breach Status if current motion is higher than the threshold
	if((xForceCurrent > xForce+XSENSITIVITY) || (xForceCurrent < xForce-XSENSITIVITY) || (yForceCurrent > yForce+YSENSITIVITY) || (zForceCurrent < zForce-YSENSITIVITY) || (zForceCurrent > zForce+ZSENSITIVITY) || (zForceCurrent < zForce-ZSENSITIVITY)) {
		breached = true;
	}
}
