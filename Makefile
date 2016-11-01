### Makefile --- Miscellaneous personal CLI tools

## Author: MichaelRWolf@att.net
## Version: $Id: Makefile,v 0.0 2016/11/01 06:32:19 michael Exp $
## Keywords: 
## X-URL: 

EXECS = say_firefox_cpu


all: $(EXECS)

say_firefox_cpu: say_firefox_cpu.pl
	cat say_firefox_cpu.pl > say_firefox_cpu
	chmod +x say_firefox_cpu

install: $(EXECS)
	install -p $(EXECS) ~/bin

clean:
	rm -f $(EXECS)


