
#define PORTB *((volatile unsigned char *)0x25)
#define DDRB *((volatile unsigned char *)0x24)

#define PINNUMBER 5


int main(void)
{
    DDRB |= (1 << PINNUMBER); // Set PINNUMBER as output DDRB = DDRB | 0b00100000
    PORTB |= (1 << PINNUMBER); // Set PINNUMBER high PORTB = PORTB | 0b00100000
    PORTB &= ~(1 << PINNUMBER); // Set PINNUMBER low PORTB = PORTB & 0b11011111
    return 0;
}