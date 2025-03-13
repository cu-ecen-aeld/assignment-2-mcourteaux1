CC ?= gcc
CFLAGS=-Wall -Werror

# Allow optional cross-compilation
ifeq ($(CROSS_COMPILE),)
    CC=gcc
else
    CC=$(CROSS_COMPILE)gcc
endif

all: writer

writer: writer.c
	$(CC) $(CFLAGS) -o writer writer.c

clean:
	rm -f writer *.o
