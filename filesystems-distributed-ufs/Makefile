CC     := gcc
CFLAGS := -Wall -g

SRCS   := client.c server.c clientmfs.c libmfs.c

OBJS   := ${SRCS:c=o}
PROGS  := ${SRCS:.c=}

.PHONY: all
all: ${PROGS}

${PROGS}:
	gcc -fPIC -g -c -Wall libmfs.c
	gcc -shared -Wl,-soname,libmfs.so -o libmfs.so libmfs.o udp.c -lc
	export LD_LIBRARY_PATH=.
	gcc -Wall  -g -c client.c
	gcc client.o  -g -o client udp.c -L. -lmfs
	gcc -Wall  -g -c server.c
	gcc server.o  -g -o server udp.c -L. -lmfs
	gcc -Wall -Werror -g -c clientmfs.c
	gcc clientmfs.o  -g -o clientmfs udp.c -L. -lmfs
	gcc ${CFLAGS} -o mkfs mkfs.c
clean:
	rm -f ${PROGS} ${OBJS} libmfs.so mkfs