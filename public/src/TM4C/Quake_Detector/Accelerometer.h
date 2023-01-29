#ifndef __Accelerometer_H__
#define __Accelerometer_H__

//	Declaration of the prototypes
extern void I2C_Init(void);
extern void InitConsole(void);
extern int32_t conjoin(int8_t, int8_t);
extern int8_t readProcess(uint32_t, uint32_t);
extern void writeProcess(uint32_t, uint32_t, uint32_t);
extern void Timer0A_Init(unsigned long period);
#endif // __ADXL_H__
