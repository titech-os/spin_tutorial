CC = gcc
CFLAGS =
SFLAGS = 

.PHONY: all clean

all: pan

pan: pan.c
	$(CC) $(CFLAGS) $(SFLAGS) -o pan pan.c

clean:
	$(RM) pan pan.*
	$(RM) *.trail
	$(RM) _spin_nvr.tmp
	$(RM) *~
