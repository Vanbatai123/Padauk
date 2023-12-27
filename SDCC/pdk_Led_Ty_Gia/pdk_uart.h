

#define UART_TX_PIN 3
extern uint16_t txdata;

void UART_begin();
int putchar(int c);
void TIM2_interrupt();
void UART_print(char* str);