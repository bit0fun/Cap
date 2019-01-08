# Build Tools
CC=gcc
LEX=flex

# Build settings
CFLAGS=-O3
LDFLAGS=


# OS Support Checks

# Not supporting windows right now
ifeq ($(OS),Windows_NT)
	$(error Windows build is currently unsupported)
endif

# checking if macOS or Linux
UNAME_S:= $(shell uname -s)

# For macOS support
ifeq ($(UNAME_S),Darwin)
LDFLAGS += -ll
endif

# For Linux support
ifeq ($(UNAME_S),Linux)
LDFLAGS += -lfl
endif


# Functional settings
DEBUG=0

# Files to use
SRCL=$(wildcard *.l)
SRC= $(wildcard *.c)
SRC+= cap.yy.c cap.tab.c
OBJ= $(SRC:.c=.o)
DEP= $(OBJ:.o=.d)


ifeq ($(DEBUG),1)
CFLAGS += -g3
endif

all: capc

capc: $(OBJ)
	$(CC) $^ $(LDFLAGS) -o $@
-include $(DEP)



$.d: %.c
	@$(CC) $(CFLAGS) $< -MM -MT $(@:.d=.o) >$@


cap.yy.c: cap.l cap.tab.h cap.tab.c
	flex -o cap.yy.c $<

cap.tab.h: cap.y
	bison -d $<


.PHONY: clean
clean:
	rm -rf *.yy.c
	rm -rf *.o
	rm -rf capc
	rm -rf *.tab.c
	rm -rf *.tab.h
