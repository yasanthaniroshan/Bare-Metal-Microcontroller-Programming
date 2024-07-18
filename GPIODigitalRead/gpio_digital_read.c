
#define PORTB *((volatile unsigned char *)0x25)
#define PORTD *((volatile unsigned char *)0x2B)
#define DDRB *((volatile unsigned char *)0x24)
#define DDRD *((volatile unsigned char *)0x2A)

#define PIND *((volatile unsigned char *)0x29)

#define DIGITAL_READ_PIN 7
#define LED_PIN 5

int main()
{
    DDRB |= (1 << LED_PIN);           // Set LED_PIN as output
    DDRD &= ~(1 << DIGITAL_READ_PIN); // Set DIGITAL_READ_PIN as input
    PORTB &= ~(1 << LED_PIN);         // Set LED_PIN high
    while (1)
    {
        if (PIND & (1 << DIGITAL_READ_PIN)) // If DIGITAL_READ_PIN is high
        {
            PORTB |= (1 << LED_PIN); // Set LED_PIN high
        }
        else if (PIND & ~(1 << LED_PIN))
        {
            PORTB &= ~(1 << LED_PIN); // Set LED_PIN low
        }
    }
}