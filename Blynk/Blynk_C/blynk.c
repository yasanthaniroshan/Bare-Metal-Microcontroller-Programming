/******************************************************************************
 * Copyright (C) 2024 by Yasantha Niroshan
 *
 * Redistribution, modification or use of this software in source or binary
 * forms is permitted as long as the files maintain this copyright. Users are
 * permitted to modify this and use it to learn about the field of Baremetal
 * Microcontroller Programming (Atmega 328). Author is not liable for any
 * misuse of this material.
 *
 *
 *****************************************************************************/
/**
 * @file blynk.c
 * @brief Blinking LED using Atmega 328
 *
 * This file blinks the LED connected to PORTB5 of Atmega 328
 *
 * @author Yasantha Niroshan
 * @date July 10, 2024
 *
 */

/**
 * Accessing the PORTB and DDRB registers using pointers
 * According to the datasheet of Atmega 328
 * PORTB is located at 0x25 (Port B Data Register)
 * DDRB is located at 0x24 (Data Direction Register B)
 * volatile keyword is used to avoid compiler optimization
 **/
#define PORTB *((volatile unsigned char *)0x25)
#define DDRB *((volatile unsigned char *)0x24)
#define TCCR1A *((volatile unsigned char *)0x80)
#define TCCR1B *((volatile unsigned char *)0x81)
#define OCR1AH *((volatile unsigned char *)0x89)
#define OCR1AL *((volatile unsigned char *)0x88)
#define TIMSK1 *((volatile unsigned char *)0x6F)
#define TIFR1 *((volatile unsigned char *)0x36)
#define TCNT1 *((volatile unsigned int *)0x84)

#define CS12 2
#define CS11 1
#define CS10 0

#define PORTB5 5
#define DDRB5 5

#define TOV1 0

#define OCIE1A 1
#define OCF1A 1

#define COM1A1 7
#define COM1A0 6

/**
 * @brief Timer1 Overflow Interrupt Service Routine
 *
 * This function toggles the PORTB5 pin of Atmega 328.
 * When Timer1 matches the value in OCR1A register,this ISR is called
 * Also, it clears the Timer1 Match Flag(OCF1A)
 *
 */
void __vector_11(void) __attribute__((signal, used, externally_visible));
void __vector_11(void)
{
    PORTB ^= (1 << PORTB5); // Toggle PORTB5
    TIFR1 ^= (1 << OCF1A);  // Clear Timer1 Compare Match A Flag
}

/**
 * @brief Main function
 *
 * This function blinks the LED connected to PORTB5 of Atmega 328
 * For 1 second delay, There are 4,000,000 cycles
 * with CLK/256 prescaler, 4,000,000/256 = 15624 cycles
 *
 * @return int
 */
int main()
{
    // Setting Timer1 Control Registers
    TCNT1 = 0;  // Initialize Timer1 Counter to 0
    TCCR1A = 0; // Initialize Timer1 Control Register A to 0
    TCCR1B = 0; // Initialize Timer1 Control Register B to 0

    // Store the value 15624 in OCR1A register
    OCR1AL = 15624 & 0xFF; // Set Timer1 Compare Register Low Byte to 15625 & 0xFF
    OCR1AH = 15624 >> 8;   // Set Timer1 Compare Register High Byte to 15625 >> 8

    // Clear Timer1 Compare Match A Flag
    TIFR1 ^= (1 << OCF1A); // Clear Timer1 Compare Match A Flag

    TCCR1B |= (1 << CS12); // Set Timer1 Clock Prescaler to 256

    DDRB |= (1 << DDRB5); // Set PORTB5 as output (Pin 13 on Arduino Uno)

    // Setting Interrupts
    __asm__ __volatile__("cli" ::: "memory"); // Disable Global Interrupt

    TIMSK1 = (1 << OCIE1A); // Enable Timer1 Overflow Interrupt

    __asm__ __volatile__("sei" ::: "memory"); // Enable Global Interrupt


    // Set PORTB5 to High
    PORTB |= (1 << PORTB5); // Set PORTB5 to High


    // Infinite Loop
    while (1);
}