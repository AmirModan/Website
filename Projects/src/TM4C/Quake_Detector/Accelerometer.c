#include <stdint.h>
#include <stdbool.h>
#include <inttypes.h>

#include "inc/hw_types.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_i2c.h"
#include "inc/tm4c123gh6pm.h"

#include "driverlib/rom.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "driverlib/i2c.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"

#include "uartstdio.h"

//Initialize I2C Interface
void I2C_Init(void)
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);
    GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_2 | GPIO_PIN_3);
    GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
    I2CMasterInitExpClk(I2C0_BASE, SysCtlClockGet(), false);
}

//Initialize UART Interface
void InitConsole(void)
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
    UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);
    UARTStdioConfig(0, 115200, 16000000);
}

//Conjoin two bytes sent by Accelerometer into one integer
int32_t conjoin(int8_t left, int8_t right)
{
    int16_t number = (int16_t) ((right << 8) | (left & 0xff));
    return (int32_t) number * 4;
}

//Receive Data from Accelerometer
int8_t readProcess(uint32_t slaveAddress, uint32_t registerAddress)
{
    I2CMasterSlaveAddrSet(I2C0_BASE, slaveAddress, false);
    I2CMasterDataPut(I2C0_BASE, registerAddress);
    I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
		while(I2CMasterBusy(I2C0_BASE)) {}
    int8_t data = 0;
    I2CMasterSlaveAddrSet(I2C0_BASE, slaveAddress, true);
    I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE);
    while(I2CMasterBusy(I2C0_BASE)) {}
    data = (int8_t)I2CMasterDataGet(I2C0_BASE);
    return data;
}

//Send Data to Accelerometer
void writeProcess(uint32_t slaveAddress, uint32_t registerAddress, uint32_t writeProcess)
{
    I2CMasterSlaveAddrSet(I2C0_BASE, slaveAddress, false);
    I2CMasterDataPut(I2C0_BASE, registerAddress);
    I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
    while(I2CMasterBusy(I2C0_BASE)) {}
    I2CMasterSlaveAddrSet(I2C0_BASE, slaveAddress, false);
    I2CMasterDataPut(I2C0_BASE, writeProcess);
    I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH);
    while(I2CMasterBusy(I2C0_BASE)) {}
}

void Timer0A_Init(unsigned long period)
{   
	volatile uint32_t ui32Loop; 
	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
  TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC); 		// configure for 32-bit timer mode
  TimerLoadSet(TIMER0_BASE, TIMER_A, period -1);      //reload value
	IntPrioritySet(INT_TIMER0A, 0x00);  	 // configure Timer0A interrupt priority as 0
  IntEnable(INT_TIMER0A);    				// enable interrupt 19 in NVIC (Timer0A)
	TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);      // arm timeout interrupt
  TimerEnable(TIMER0_BASE, TIMER_A);      // enable timer0A
}
