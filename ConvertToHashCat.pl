#!/usr/bin/perl
# ConvertToHashCat.pl - This script reads in a file of NETNTLM hashs in JtR format
#                       and converts them into the format hashcat uses.
#
#  Credit for regex goes to rajak on the Hashcat forums
#                                                      
# Author: fuzztester
# Date: August 28 2013
#
# Originally retrieved from http://pastebin.com/962TBm8Y via @fuzztester
use strict;
use warnings;
 

my $inputFile = $ARGV[0];
my $outputFile = $ARGV[1];
 
open (INPUT, "<$inputFile") || die "Can't open file: $inputFile : $!\n";
open (OUTPUT, ">>$outputFile") || die "Can't open file $outputFile: $!\n";
 
while (<INPUT>) {
  chomp;
  if ($_ =~ m/(.*?):\$.*?\$(.*?)\$(.*)/) {
    print OUTPUT "$1::::$3:$2\n";
  }
 
}
close (INPUT);
close (OUTPUT);
