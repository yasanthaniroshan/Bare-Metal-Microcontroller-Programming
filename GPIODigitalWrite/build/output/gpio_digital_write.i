# 1 "build/gpio_digital_write.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "build/gpio_digital_write.c"







int main(void)
{
    *((volatile unsigned char *)0x24) |= (1 << 5);
    *((volatile unsigned char *)0x25) |= (1 << 5);
    *((volatile unsigned char *)0x25) &= ~(1 << 5);
    return 0;
}
