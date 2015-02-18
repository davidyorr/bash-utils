#!/bin/sh

width=$(wc -l $1 | awk '{print length($1)}')
awk	'/INFO/ {printf("%'$width'd %s\n", NR, "\033[36m" $0 "\033[39m")} \
	/DEBUG/ {printf("%'$width'd %s\n", NR, "\033[35m" $0 "\033[39m")} \
	/WARN/ {printf("%'$width'd %s\n", NR, "\033[33m" $0 "\033[39m")} \
	/ERROR/ {printf("%'$width'd %s\n", NR, "\033[31m" $0 "\033[39m")} \
	(!/INFO/ && !/DEBUG/ && !/WARN/ && !/ERROR/) {printf("%'$width'd %s\n", NR, $0)}' \
	$1 | less -R

