
/*
	Note :	At switch I2C_SDA

	$ I2C_SDA	Low, Out	:	Error

	$ I2C_SDA	Out, Low	:	OK
*/

I2C_SDA		BIT	PB.6;
I2C_SCL		BIT	PB.7;

static	void	I2C_Write_Acc (void)
{
	BYTE	data, count;
	data	=	~ A;
	count	=	8;

	do
	{
		$ I2C_SCL	Low;			//	1
		sl		data;				//	2
		#if	_SYS(OP:SWAPC IO.N)
			swapc	_PXC(I2C_SDA);		//	3
			$ I2C_SDA	Low;			//	4
		#else
			if (!CF)	$ I2C_SDA	In;		//	34
			if (CF)		$ I2C_SDA	Out;	//	56
			$ I2C_SDA	Low;				//	7
		#endif

		$ I2C_SCL	High;			//	1
	} while (--count);				//	2, 3

	$ I2C_SCL	Low;				//	1
	$ I2C_SDA	In;					//	2

	$ I2C_SCL	High;				//	1
//	if (I2C_SDA) trap;				//	Pleass add you code, when no Ack ..
}									//	2

static	void	I2C_Read_Acc (void)
{
	BYTE	data, count;
	count	=	8;
	do
	{
		$ I2C_SCL	Low;			//	1
		$ I2C_SDA	In;				//	2

		$ I2C_SCL	High;			//	1
		#if	_SYS(OP:SWAPC IO.N)
			swapc	I2C_SDA;			//	2
			slc		data;				//	3
		#else
			sl		data;					//	2
			if (I2C_SDA)	data.0	=	1;	//	34
		#endif
	} while (--count);				//	4, 5

	$ I2C_SCL	Low;				//	1
//	if (! I2C_SDA) trap;
	$ I2C_SDA	Out, Low;			//	2/3	SDA	:	Output Low

	$ I2C_SCL	High;				//	1
	A	=	data;					//	2
}									//	3

static	void	I2C_Stop (void)
{
	$ I2C_SCL	Low;				//	1
//	if (! I2C_SDA) trap;
	$ I2C_SDA	Out, Low;			//	2/3	SDA	:	Output Low

	$ I2C_SCL	High;				//	1

	$ I2C_SDA	In;					//	1	SDA	:	Pull High	:	Stop
}									//	2

WORD	I2C_Address;				//	High Byte :	Device Address
									//	Low Byte :	Word Address

I2C_DEVICE	EQU	0xA0	//	Please modify it by your device
						//	Because only 24Cxx use the 0xA0 for device code.

enum	{	IS_24C01_16, IS_24C32_512	};
enum	{	I2C_WR_CMD = 0, I2C_RD_CMD = 0x10 };

I2C_DEVICE_SEL	EQU		IS_24C01_16
/*
	Input	:	A			=	I2C_WR_CMD
				A			=	I2C_RD_CMD
				I2C_Address		I2C EEPROM Address
*/

#if	I2C_DEVICE_SEL == IS_24C01_16

static	void	I2C_Set_Address (void)
{
	BYTE	is_read	=	A;
	BIT		f_read	:	is_read.4;
	BIT		f_last	:	is_read.0;
	while (1)
	{
		$ I2C_SDA	Out, Low;		//	1/2	SDA	:	Output Low	:	Start

		A	=	I2C_DEVICE | (I2C_Address$1 << 1);	//	2
		if (f_last)	A = A | 1;

		I2C_Write_Acc();			//	4
		if (I2C_SDA)
		{
			I2C_Stop();
			continue;
		}

		if (f_last) return;

		A	=	I2C_Address;
		I2C_Write_Acc();

		if (! f_read) return;		//	Set writer address ok when (is_read == 0)

		f_last	=	1;

		I2C_Stop();
	}
}

#elseif	I2C_DEVICE_SEL == IS_24C32_512

static	void	I2C_Set_Address (void)
{
	BYTE	is_read	=	A;
	BIT	f_read	:	is_read.4;
	while (1)
	{
		$ I2C_SDA	Out, Low;		//	SDA	:	Output Low	:	Start
		Easy_Delay (Delay_Start, 7);

		A	=	I2C_DEVICE;			//	2
		if (is_read.2)	A	|=	1;	//	Set Read Mode

@@:		I2C_Write_Acc();			//	4
		if (I2C_SDA)
		{
			is_read	&=	I2C_RD_CMD;
			I2C_Stop();
			continue;
		}

		if (is_read.2)	return;
		if (is_read.1)
		{
			if (! f_read)	return;

			is_read.2	=	1;
			I2C_Stop();
			continue;
		}
		is_read++;
		A	=	I2C_Address$1;
		if (is_read.1)	A	=	I2C_Address$0;
		goto	@B;
	}
}

#endif

void	I2C_Write_Byte (void)
{
	BYTE	I2C_Data	=	A;
	A	=	I2C_WR_CMD;		//	Write
	I2C_Set_Address();

	A	=	I2C_Data;
	I2C_Write_Acc();

	I2C_Stop();
}

void	I2C_Read_Byte (void)
{
	A	=	I2C_RD_CMD;		//	Read
	I2C_Set_Address();

	I2C_Read_Acc();

	$ I2C_SDA	In;
}

WORD	RAM_Address;
BYTE	I2C_Count;

void	I2C_Write_Buffer (void)
{
	A	=	I2C_WR_CMD;		//	Write
	I2C_Set_Address();

	do
	{
		A	=	*RAM_Address++;
		I2C_Write_Acc();
	} while (--I2C_Count);

	I2C_Stop();
}

void	I2C_Read_Buffer (void)
{
	A	=	I2C_RD_CMD;		//	Read
	I2C_Set_Address();

	do
	{
		I2C_Read_Acc();
		*RAM_Address++	=	A;
	} while (--I2C_Count);

	$ I2C_SDA	In;
}

void	I2C_HandShake (void)
{
	$ I2C_SDA	Low, In;	//	Pull be skip
	$ I2C_SCL	High, Out;
//
	I2C_Address	=	0;
	A	=	0x55;
	I2C_Write_Byte();		//	Address 0, write 0x55

	I2C_Address$0++;
	A	=	0xAA;
	I2C_Write_Byte();		//	Address 1, write 0xAA
//
	I2C_Address	=	0;
	I2C_Read_Byte();		//	Address 0, read
	//	if (A != 0x55)	..

	I2C_Address$0++;
	I2C_Read_Byte();		//	Address 1, read
	//	if (A != 0xAA)	..
//
	I2C_Address	=	0;
	BYTE	buffer[8];

	while (1)
	{
		RAM_Address	=	Buffer;
		I2C_Count	=	8;
		I2C_Read_Buffer();	//	Address 0, read 8 byte

		RAM_Address	=	Buffer;
		I2C_Count	=	8;
		I2C_Write_Buffer();	//	Address 0, write 8 byte
	}
}

