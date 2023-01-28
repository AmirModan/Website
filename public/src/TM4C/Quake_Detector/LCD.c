#include <stdint.h>
#include <stdbool.h>
#include "driverlib/sysctl.h"
#include "TM4C123GH6PM.h"
#include "inc/tm4c123gh6pm.h"
#include "delay.h"
#include "LCD.H"


//Enable LCD
void enable(void){																			
					LCD_PORT->DATA|=(1<<EN);
				__ASM volatile ("MOV R2 ,#0xFF");		//Check this instruction delay, This should be about 1us
				LCD_PORT->DATA&=~(1<<EN);
}

//Read LCD Screen Status
uint8_t Read(uint8_t ret){
							uint8_t read_byte=0;	
							LCD_PORT1->DEN&=~(0xF); 																		
							LCD_PORT1->DIR&=~0xF; 	
							LCD_PORT1->DEN|=(0xF);
							LCD_PORT->DATA&=~(1<<RS);
							LCD_PORT->DATA|=(1<<RW);
							enable();
							read_byte=(0x0F&LCD_PORT1->DATA);
							read_byte=(read_byte<<4)&(0xF0);
							enable();
							read_byte|=(0x0F&LCD_PORT1->DATA);
							if(ret==bsy_flg){
							read_byte&=(1<<7);
							read_byte=(read_byte>>7);		
							}
							return read_byte ;
}
//Write to LCD Screen Configuration Port
void LCD_bus_write(uint8_t data){
		  LCD_PORT1->DEN&=~(0xF); 
			LCD_PORT1->DIR|=0xF;       									//	Setting the LCD_PORT output
			LCD_PORT1->DATA&=(0xF0);
			LCD_PORT1->DEN|=(0xF);  											//	Enabling digital pins from 0 to 3
			LCD_PORT1->DATA|=(0x0F&data);																
}
//Initialize LCD Screen
void LCD_Init(unsigned char mode){

				LCD_PORT->LOCK=0x4C4F434B;
				LCD_PORT->CR|=(1<<EN)|(1<<RW)|(1<<RS);//
				LCD_PORT->DIR|=(1<<EN)|(1<<RW)|(1<<RS);
				LCD_PORT->DEN|=(1<<EN)|(1<<RW)|(1<<RS);
	 
				LCD_PORT1->LOCK=0x4C4F434B;
				LCD_PORT1->CR|=(0xF);
	 
				SysCtlDelay(SysCtlClockGet()/150);
				LCD_PORT->DATA&=~((1<<RS)|(1<<RW));
				
				LCD_bus_write(0x03);
				enable();
				SysCtlDelay(SysCtlClockGet()/600);
				 
				LCD_bus_write(0x03);
		    enable();		
	      SysCtlDelay(SysCtlClockGet()/3000);
				
				LCD_bus_write(0x03);
				enable();
				LCD_bus_write(1<<1);
				enable();
				
				LCD_command(1<<5);
				LCD_command(mode);
				LCD_command(clrscr);
				LCD_command(0x6);
 }

//Write to LCD Screen IR Register
void LCD_command(unsigned char com){
						while(Read(bsy_flg)!=0);
						LCD_PORT->DATA&=~((1<<RS)|(1<<RW));
						LCD_bus_write(com>>4);
						enable();
						LCD_bus_write(com);
						enable();
}

//Write to LCD Screen DR Register
void LCD_data(unsigned char com){
						while(Read(bsy_flg)!=0);
						LCD_PORT->DATA&=~(1<<RW);
						LCD_PORT->DATA|=(1<<RS);
						LCD_bus_write(com>>4);
						enable();
						LCD_bus_write(com);
						enable();
}
//Clear LCD Display
void LCD_clrscr(void){
				LCD_command(1);
			  LCD_goto(0,0);
}
//Display String
void LCD_puts(const char *s)
{
    register char c;
    while ( (c = *s++) ) {
        LCD_putc(c);
    }
}
//Display Character
void LCD_putc(unsigned char a){
		unsigned add=Read(add_count);
		if(a=='\n'){
			LCD_command(0xc0);
		} else if(a=='\b'){
			LCD_command(0x13);
		}
		else{
		LCD_data(a);	
		}
}

void LCD_puti(long int print_val){
		uint16_t i=0,buff[20];
		if (print_val<0)
						{
							LCD_putc('-');
							print_val*=(-1);
						}
						else if (print_val==0) {
							LCD_putc('0');
							return;
						}
	
		int temp=print_val;
						for(i=0;print_val!=0;i++){
							buff[i]=temp%10;
							print_val=print_val/10;
							temp=print_val;
							}
							for(;i!=0;--i){
							LCD_putc(buff[i-1]+48);
							}	
}

//Place Cursor
void LCD_goto(uint8_t clm,uint8_t row){
		if(row==0) LCD_command(0x80+clm);
		else 				LCD_command(0xC0+clm);
}
