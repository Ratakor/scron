CFLAGS += -std=c99 -Wall -Wextra -pedantic -D_POSIX_C_SOURCE=200809L -D_DEFAULT_SOURCE

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/man

SRC = scron

all: $(SRC)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(SRC) $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(SRC)
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f $(SRC).1 $(DESTDIR)$(MANPREFIX)/man1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/$(SRC).1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(SRC)\
		$(DESTDIR)$(MANPREFIX)/man1/$(SRC).1

clean:
	rm -f $(SRC)

.PHONY: all install uninstall clean
