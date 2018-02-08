#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor;


#1. Private decryption key Generation
my $rand = int(rand(10)); #Generating a Random index
my @prime_P = (151, 157, 163, 167, 173, 179, 181, 191, 193, 197); #Array of prime numbers for P Value
my @prime_Q = (3, 5, 7, 11, 13, 17, 19, 23, 29, 31); #Array of prime numbers for Q Value
my @prime_D = (251, 257, 263, 269, 271, 277, 281, 283, 293, 307); #Array of prime numbers for Q Value

#1.1 Calculation of N Value
my $nValue = $prime_P[$rand]*$prime_Q[$rand];

#1.2 Calculation of Phi(N) value
my $phi_N = ($prime_P[$rand]-1)*($prime_Q[$rand]-1);