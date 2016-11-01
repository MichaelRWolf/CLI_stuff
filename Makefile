### Makefile --- Miscellaneous personal CLI tools

## Author: MichaelRWolf@att.net
## Version: $Id: Makefile,v 0.0 2016/11/01 06:32:19 michael Exp $
## Keywords: 
## X-URL: 

all: say_firefox

say_firefox: say_firefox.pl
	cat say_firefox.pl > say_firefox
	chmod +x say_firefox

clean:
	rm -f say_firefox