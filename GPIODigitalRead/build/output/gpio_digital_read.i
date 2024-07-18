# 1 "build/gpio_digital_read.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "build/gpio_digital_read.c"
# 12 "build/gpio_digital_read.c"
int main()
{
    *((volatile unsigned char *)0x24) |= (1 << 5);
    *((volatile unsigned char *)0x2A) &= ~(1 << 7);
    *((volatile unsigned char *)0x25) &= ~(1 << 5);
    while (1)
    {
        if (*((volatile unsigned char *)0x29) & (1 << 7))
        {
            *((volatile unsigned char *)0x25) |= (1 << 5);
        }
        else if(*((volatile unsigned char *)0x29) &~(1<<5))
        {
            *((volatile unsigned char *)0x25) &= ~(1 << 5);
        }
    }
}
