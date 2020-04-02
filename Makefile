PREFIX ?= /usr

all:
	@echo Run \'make install\' to install autotmux.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p neofetch $(DESTDIR)$(PREFIX)/bin/autotmux
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/autotmux

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/autotmux
