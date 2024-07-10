# 1 "build/blynk.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "build/blynk.c"
# 63 "build/blynk.c"
void __vector_11(void) __attribute__((signal, used, externally_visible));
void __vector_11(void)
{
    *((volatile unsigned char *)0x25) ^= (1 << 5);
    *((volatile unsigned char *)0x36) ^= (1 << 1);
}
# 79 "build/blynk.c"
int main()
{

    *((volatile unsigned int *)0x84) = 0;
    *((volatile unsigned char *)0x80) = 0;
    *((volatile unsigned char *)0x81) = 0;


    *((volatile unsigned char *)0x88) = 15624 & 0xFF;
    *((volatile unsigned char *)0x89) = 15624 >> 8;


    *((volatile unsigned char *)0x36) ^= (1 << 1);

    *((volatile unsigned char *)0x81) |= (1 << 2);

    *((volatile unsigned char *)0x24) |= (1 << 5);


    __asm__ __volatile__("cli" ::: "memory");

    *((volatile unsigned char *)0x6F) = (1 << 1);

    __asm__ __volatile__("sei" ::: "memory");



    *((volatile unsigned char *)0x25) |= (1 << 5);



    while (1);
}
