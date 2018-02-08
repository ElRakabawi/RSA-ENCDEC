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

#1.3 Calculation of e Value (Small exponenet)
# Conditions: 1) Greater than 1 
#             2)less than phi(N) 
#             3) Not a factor of N
my $MGCD = 3; #Initial value for experimental use 
 
#1.4 Calculation of D value (Private key)
sub private_D {
  my (@primeD_Val) = @_;
  my $len_arr = scalar(@primeD_Val);
  my $private_D = $primeD_Val[int(rand(10))];
  my $valid = 0;
  for (my $i = 0; $i<$len_arr; $i++){
    if( $phi_N % $private_D != 0){
      $valid = 1;
      return $private_D;
    }
    else {
      my $private_D = $primeD_Val[int(rand(10))];
    }
  }
  if ($valid == 0){
    print "An Error has occured, please try a new fucking prime numbers list.\n";
  }
}

my $private_key = private_D(@prime_D); #Calculation of Private key using D-value Calculation


#Printing out values for experimental use
print "P is $prime_P[$rand]\n";
print "Q is $prime_Q[$rand]\n";
print "phi(N) is $phi_N\n";
print "Private key (D value) is $private_key \n";