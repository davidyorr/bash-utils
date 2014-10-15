#!/bin/sh

tail -f $1 | awk \
	'/INFO/ {print "\033[36m" $0 "\033[39m"} \
	/DEBUG/ {print "\033[35m" $0 "\033[39m"} \
	/WARN/ {print "\033[33m" $0 "\033[39m"} \
	/ERROR/ {print "\033[31m" $0 "\033[39m"} \
	(!/INFO/ && !/DEBUG/ && !/WARN/ && !/ERROR/) {print}'

