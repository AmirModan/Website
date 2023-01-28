#ifndef 	LCD_H
#define	  LCD_H

#define  	      LCD_PORT							GPIOB
#define  	      LCD_PORT1							GPIOE
#define   	     RS									  	4
#define  	       RW  										5
#define  	       EN											6

#define      PORTA											0
#define      PORTB											1
#define      PORTC											2
#define      PORTD											3

#define    PORT_index     				   	PORTB

#define			add_count 									0
#define			bsy_flg		  								1
#define 		read				    						1
#define 		write						    				0

#define 		on_crs										0x0E
#define			off_crs										0x0C
#define			blnk_crs									0x0F
#define 		clrscr										0x01
#define			home					  					0x02
			
extern 	void LCD_Init(unsigned char mode);
extern 	void enable(void);
extern 	void LCD_command(unsigned char com);
extern 	void LCD_data(unsigned char data);
extern 	uint8_t Bussy_read (uint8_t ret);
extern 	void LCD_clrscr(void);
extern  void LCD_bus_write(uint8_t data);
extern  void LCD_puts(const char *s);
extern	void LCD_puti(long int print_val);
extern  void LCD_putc(unsigned char a);
extern	void LCD_goto(uint8_t col,uint8_t row);

#endif     //LCD_H
