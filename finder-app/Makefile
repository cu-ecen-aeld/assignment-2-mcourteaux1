CC=gcc
CROSS_COMPILE=aarch64-none-linux-gnu-
CFLAGS=-Wall -Werror

# Detect if cross-compiling
ifeq ($(CROSS_COMPILE),)
    CC=$(CC)
else
    CC=$(CROSS_COMPILE)gcc
endif

all: writer

writer: writer.c
	$(CC) $(CFLAGS) -o writer writer.c

clean:
	rm -f writer *.o
