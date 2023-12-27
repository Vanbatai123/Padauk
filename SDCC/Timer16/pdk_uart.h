

#define UART_TX_PIN 7
extern uint16_t txdata;

void UART_begin();
int putChar(int c);
void TIM2_interrupt();