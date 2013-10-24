ALL=svg2pdf
INSTALL=`which install`
INSTALL_PATH=/usr/bin

MYCFLAGS=`pkg-config --cflags librsvg-2.0 cairo-pdf` -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -fno-strict-aliasing
MYLDFLAGS=`pkg-config --libs librsvg-2.0 cairo-pdf`

all: $(ALL)

install:
	$(INSTALL) $(ALL) $(INSTALL_PATH)/

uninstall:
	rm $(INSTALL_PATH)/$(ALL)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(MYCFLAGS) $< -o $@

%: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(MYCFLAGS) $(MYLDFLAGS) $^ -o $@

clean:
	rm -f $(ALL) *.o
