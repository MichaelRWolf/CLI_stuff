### Makefile --- Miscellaneous personal CLI tools

## Author: MichaelRWolf@att.net
## Version: $Id: Makefile,v 0.0 2016/11/01 06:32:19 michael Exp $
## Keywords: 
## X-URL: 

EXECS = say_firefox


all: $(EXECS)

say_firefox: say_firefox.pl
	cat say_firefox.pl > say_firefox
	chmod +x say_firefox

install: $(EXECS)
	install -p $(EXECS) ~/bin

clean:
	rm -f $(EXECS)


