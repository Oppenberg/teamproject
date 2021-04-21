CFLAGS = -m64 -g -Wall -O3 -fopenmp
LDFLAGS = -L. -lutils

all:    stream.exe

stream.exe: libutils.a stream.o
        gcc $(CFLAGS) -o stream.exe stream.o $(LDFLAGS)

utils.o:        utils.c utils.h talker.c
        gcc $(CFLAGS) -c utils.c

libutils.a:     utils.o
        ar rv libutils.a utils.o
        ranlib libutils.a

stream.o:       stream.c utils.h
        gcc $(CFLAGS) -c stream.c
