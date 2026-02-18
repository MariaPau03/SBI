#!/usr/bin/perl
use strict;


my $fitxer_llista;
my $fitxer_entrada;
my $fitxer_sortida;
my $i;
my @llista;
my $linea;
my $found;
my $check;
my $code;

if (scalar(@ARGV) < 3) {                          
  print STDERR "s'han d'entrar els parametres: nom_programa fitxer_llista fitxer_entrada fitxer_sortida\n"; 
  exit(1);                                        
}

$fitxer_llista=$ARGV[0];
$fitxer_entrada=$ARGV[1];
$fitxer_sortida=$ARGV[2];


$i=0;
open(IN,"<$fitxer_llista");
while(<IN>)
	{
	print $_;
	if ($_=~ /\w+\s+\((\w+)\)/)
		{
		print "$1\n";
		$llista[$i]=$1;
		$i=$i+1;
		}
	}
close(IN);
		
open(FASIN,"<$fitxer_entrada");
open(FASOUT,">$fitxer_sortida");


$linea=<FASIN>;
while($linea)
	{
	$found=0;
	if ($linea=~ /\w+\s+\((\w+)\)/)
		{
		$i=0;
		$found=0;
		$code=$1;
		#print "$code\n";
		while($i<scalar(@llista))
			{
			$check=$llista[$i];
			if ($code eq $check)
				{
				print FASOUT "$linea";
				print "$linea";
				$found=1;
				$linea=<FASIN>;
				while (($linea) && (substr($linea,0,1) ne ">"))
					{
					print FASOUT "$linea";
					print $linea;
					$linea=<FASIN>;
					}
				}
			$i=$i+1;
			}			
		}
	if ($found==0)
		{
		$linea=<FASIN>;
		}
	}
close(FASIN);
close(FASOUT);


 
