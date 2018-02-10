#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor;


#1. Private decryption key Generation
my $rand = int(rand(10)); #Generating a Random index
print color("GREEN"), "Welcome to RSA Encryption/Decryption script\n";
print "Enter E for Encrypting a message using Public key or D for Decrypting a message using your Private key\n", color("RESET");
my $choice = <STDIN>;
chomp $choice;
if($choice eq 'E'){
  print "Enter N to generate a new Public Key or Enter Your Public Key to start Encrypting mode\n";
  my $follow = <STDIN>;
  chomp $follow;
  if($follow eq 'N'){
    print "Please enter the first Large Prime Number\n";
    my $prime_P = <STDIN>;
    chomp $prime_P;

    print "Please enter the second Large Prime Number\n";
    my $prime_Q = <STDIN>;
    chomp $prime_Q;

    my @prime_D = (251, 257, 263, 269, 271, 277, 281, 283, 293, 307); #Array of prime numbers for Q Value

    #1.1 Calculation of N Value
    my $nValue = $prime_P*$prime_Q;

    #1.2 Calculation of Phi(N) value
    my $phi_N = ($prime_P-1)*($prime_Q-1);

    #1.3 Calculation of e Value (Small exponenet)
    # Conditions: 1) An Integer Greater than 1
    #             2) less than phi(N)
    #             3) Not be a factor of N
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

    #2. Public Key Calculation
    sub Public_P {
      my ($eValue, $NCalc, $data) = @_;
      my $eData = $data**$eValue % $NCalc;
      return $eData;
    }

    my $Enc_Data = Public_P($MGCD, $nValue, 80);


    #Printing out values for experimental use
    print "P is $prime_P\n";
    print "Q is $prime_Q\n";
    print "phi(N) is $phi_N\n";
    print "Private key (D value) is $private_key \n";
    print "Encrypted Data is $Enc_Data \n";

  }
  else {
    print color("RED"), "Under progress..\n", color("RESET");
  }
}
elsif($choice eq 'D'){
  print color("RED"), "Under progress..\n", color("RESET");
}
else {
  print color("RED"), "Can't type an E or D? and want to use a cryptosystem!\n", color("RESET");
}
