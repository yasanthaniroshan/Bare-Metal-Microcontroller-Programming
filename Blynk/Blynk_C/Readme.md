# Blynk 

This project demonstrates how to implement Blynk functionality on an Arduino Uno (Atmega328p) using pure C programming without the Arduino libraries. The code utilizes the AVR-GCC toolchain for compilation and flashing the firmware onto the microcontroller.

## Project Structure

```
├── blynk.c         # Main C source file
├── makefile        # Makefile for building the project
└── README.md       # Project documentation
```
## Prerequisites
- [AVR-GCC toolchain](https://gcc.gnu.org/wiki/avr-gcc)
- [avrdude](https://www.nongnu.org/avrdude/)
- Arduino Uno (Atmega328p)

## Code Overview (blynk.c)

The code leverages direct register access and timer interrupts to blink an LED connected to pin 13 (PORTB5) of the Arduino Uno. Let's break down the key components:

1. **Register Definitions**

    ```c
    #define PORTB *((volatile unsigned char *)0x25)
    #define DDRB *((volatile unsigned char *)0x24)
    #define TCCR1A *((volatile unsigned char *)0x80)
    // ... other register definitions
    ```

- We use preprocessor directives (`#define`) to create human-readable aliases for memory-mapped registers of the Atmega328P. 
- `volatile` ensures the compiler doesn't optimize away reads and writes to these registers, which are crucial for interacting with hardware.

2. **Timer1 Compare Match Interrupt Service Routine (ISR)**

    ```c
    void __vector_11(void) __attribute__((signal, used, externally_visible));
    void __vector_11(void)
    {
        PORTB ^= (1 << PORTB5); // Toggle PORTB5
        TIFR1 ^= (1 << OCF1A);  // Clear Timer1 Compare Match A Flag
    }
    ```

    - `__vector_11` is a special function name that maps to the Timer1 Compare Match A interrupt vector of the Atmega328P.
    - This ISR is executed whenever Timer1 matches the value stored in the `OCR1A` register.
    -  `PORTB ^= (1 << PORTB5);` toggles the state of the LED connected to PORTB5.
    -  `TIFR1 ^= (1 << OCF1A);` clears the interrupt flag, signaling that the interrupt has been handled.

3. **Main Function (`main`)**

    ```c
    int main()
    {
        // ... (Timer1 Configuration - Explained Below) 

        DDRB |= (1 << DDRB5); // Set PORTB5 as output

        // ... (Interrupt Setup - Explained Below)

        PORTB |= (1 << PORTB5); // Set PORTB5 to High initially

        while (1); // Infinite loop
    }
    ```

    - `DDRB |= (1 << DDRB5);` configures PORTB5 as an output pin.
    - The `while (1);` statement creates an infinite loop. The LED blinking is handled by the timer interrupt, so the main function doesn't need to do anything else after the initial setup.

4. **Timer1 Configuration**

    ```c
        TCNT1 = 0;  
        TCCR1A = 0; 
        TCCR1B = 0; 

        OCR1AL = 15624 & 0xFF; 
        OCR1AH = 15624 >> 8; 

        TIFR1 ^= (1 << OCF1A);

        TCCR1B |= (1 << CS12); 
    ```

    -  These lines configure Timer1 to generate an interrupt at a specific frequency, controlling the blinking rate of the LED.
    -  `TCCR1A` and `TCCR1B` are the control registers for Timer1, used to set the mode and prescaler.
    -  `OCR1A` is the Output Compare Register, which stores the value that Timer1 compares its counter to.
    -  `CS12` sets the prescaler to 256, slowing down the timer's clock.
    -  The combination of `OCR1A` and the prescaler determines the interrupt frequency.

5. **Interrupt Setup**

    ```c
        __asm__ __volatile__("cli" ::: "memory"); // Disable Interrupts

        TIMSK1 = (1 << OCIE1A); // Enable Timer1 Compare Match A Interrupt

        __asm__ __volatile__("sei" ::: "memory"); // Enable Interrupts
    ```

    -  Interrupts are temporarily disabled (`cli`) to prevent them from interfering with the setup process.
    -  `TIMSK1 = (1 << OCIE1A);` enables the Timer1 Compare Match A interrupt.
    -  Interrupts are re-enabled (`sei`) after the setup is complete.

## Makefile Overview

The makefile provided in this project performs the following tasks:

- Initializes the build directory.
- Copies the source file to the build directory.
- Preprocesses the source file.
- Compiles the source file to assembly.
- Assembles the assembly file to an object file.
- Links the object file to create a hex file.
- Flashes the hex file to the Arduino Uno.

### Key Makefile Targets
- initializeDir: Creates the output directory.
- copyFiles: Copies the source file to the build directory.
- preprocess: Preprocesses the source file.
- compile: Compiles the source file to assembly.
- assemble: Assembles the assembly file to an object file.
- flash: Flashes the hex file to the microcontroller.
- all: Runs all the above steps.
- clean: Cleans the build directory.

## Building and Flashing the Project
- Connect your Arduino Uno to your computer.
- Navigate to the project directory.
- Run the following command to build and flash the project
  ```bash
    make all
    ```

## Conclusion
This project demonstrates how to implement Blynk functionality on an Arduino Uno using pure C programming. By directly accessing hardware registers and utilizing timer interrupts, we can achieve the desired functionality without relying on Arduino libraries. This approach provides a deeper understanding of the underlying hardware and software interactions, making it a valuable learning experience for embedded systems enthusiasts.

## References

- [Atmega328P Datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48A-PA-88A-PA-168A-PA-328-P-DS-DS40002061A.pdf)
- [YouTube Video Tutorial](https://www.youtube.com/playlist?list=PLNyfXcjhOAwOF-7S-ZoW2wuQ6Y-4hfjMR)


## Author
- [Yasantha Niroshan](https://yasantha.me/)