BIN = bin
SRC = src/c

DOCKER = docker run --rm -v $(shell pwd):/workdir multiarch/crossbuild
CROSS_ENV_DIR = /usr/mipsel-linux-gnu/bin

CC = $(DOCKER) $(CROSS_ENV_DIR)/gcc
AS = $(DOCKER) $(CROSS_ENV_DIR)/as
LD = $(DOCKER) $(CROSS_ENV_DIR)/ld
COPY = $(DOCKER) $(CROSS_ENV_DIR)/objcopy
DUMP = $(DOCKER) $(CROSS_ENV_DIR)/objdump

.PHONY: fib build elf bin

all: fib

fib:
	$(CC) -ffreestanding -nostdlib -mips1 -O0 -c $(SRC)/fib.c -o $(BIN)/fib.o
	@make build

build: $(BIN)/fib.o
	$(LD) -T ./linker.ld -o $(BIN)/fib.elf $^
	$(COPY) -O binary --only-section=.text --only-section=.data $(BIN)/fib.elf $(BIN)/fib
	$(DUMP) -m mips -b binary --endian=little -D $(BIN)/fib | awk 'NR > 7 {printf "%s    // %-6s %-10s\n", $$2,$$3,$$4}' > $(BIN)/fib.rom

elf:
	$(DUMP) -D $(BIN)/fib.elf

bin:
	$(DUMP) -m mips -b binary --endian=little -D $(BIN)/fib
