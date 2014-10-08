#!/usr/bin/perl

use strict;
use warnings;

my @ls_output = `ls -al @ARGV`;
my @octal_bit = ( 400, 200, 100, 40, 20, 10, 4, 2, 1 );

sub main {
	foreach my $line (@ls_output) {
		my @permissions = split(" ", $line);
		if (@permissions == 0) {
			print "\n";
			next;
		}
		if ($permissions[0] !~ /^[sd-]/ || length($permissions[0]) != 10) {
			print "$permissions[0]\n";
			next;
		}
		my $octal = my $i = 0;
		foreach my $char (split //, substr $permissions[0], 1) {
			if ($char ne "-") {
				$octal += $octal_bit[$i];
			}
			$i++;
		}
		printf "%03d" . (substr $line, 10), $octal;
	}
}

main();

