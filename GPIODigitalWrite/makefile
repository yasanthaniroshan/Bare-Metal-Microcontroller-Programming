# Compiler : avr-gcc
CC = avr-gcc

# nm : avr-nm
NM = avr-nm

# Microcontroller : atmega328p
MMCU = atmega328p

# File name : blink
FILE = gpio_digital_write

# Files assosiated
# - $(SOURCE) : C source file
# - $(PREPROCCESSED) : Preprocessed file
# - $(ASSEMBLY) : Assembly file
# - $(OBJECT) : Object file
# - $(HEX) : Hex file
SOURCE = $(FILE).c
PREPROCCESSED = $(FILE).i
ASSEMBLY = $(FILE).s
OBJECT = $(FILE).o
HEX = $(FILE).hex

# Build directory
BUILD = build
# Output directory
OUTPUT = $(BUILD)/output

# Flags
# - $(PRE_FLAGS) : Preprocessing flags
PRE_FLAGS = -mmcu=$(MMCU) -Werror -E $(BUILD)/$(SOURCE) -o $(OUTPUT)/$(PREPROCCESSED)

# Compiler flags
COMP_FLAGS = -mmcu=$(MMCU) -Werror -S $(BUILD)/$(SOURCE) -o $(OUTPUT)/$(ASSEMBLY)

# Assembler flags
ASM_FLAGS = -mmcu=$(MMCU) -Werror -c $(OUTPUT)/$(ASSEMBLY) -o $(OUTPUT)/$(OBJECT)


# 
initializeDir:
	mkdir -p $(OUTPUT)

copyFiles:
	cp $(SOURCE) $(BUILD)/$(SOURCE)

preprocess: initializeDir copyFiles
	$(CC) $(PRE_FLAGS)

compile :
	$(CC) $(COMP_FLAGS)

assemble :
	$(CC) $(ASM_FLAGS)
	
flash :
	$(CC) -mmcu=$(MMCU) -O0 -o $(OUTPUT)/$(OBJECT) $(BUILD)/$(SOURCE) -Wl,-Map=$(OUTPUT)/$(FILE).map
	$(NM) -n $(OUTPUT)/$(OBJECT) > $(OUTPUT)/$(FILE).nm
	avr-objcopy -O ihex -j .text -j .data $(OUTPUT)/$(OBJECT) $(OUTPUT)/$(HEX)
	avr-size --format=avr --mcu=$(MMCU) $(OUTPUT)/$(OBJECT) > $(OUTPUT)/$(FILE)-size.txt
	avrdude -C /etc/avrdude.conf -v -p $(MMCU) -c arduino -P /dev/ttyACM0 -b 115200 -D -U flash:w:$(OUTPUT)/$(HEX)

all : initializeDir copyFiles  preprocess compile assemble flash


clean:
	rm -rf build

