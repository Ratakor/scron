CC = gcc # x86_64-linux-musl-gcc
CFLAGS = -Os -std=c99 -Wall -Wextra -pedantic -D_POSIX_C_SOURCE=200809L -D_BSD_SOURCE
LDFLAGS = -s # -static
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/man

all: crond

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f crond $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f scron.1 $(DESTDIR)$(MANPREFIX)/man1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/crond
	rm -f $(DESTDIR)$(MANPREFIX)/man1/scron.1

clean:
	rm -f crond

.PHONY:
	all install uninstall clean
