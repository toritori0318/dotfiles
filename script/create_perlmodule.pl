#!/usr/bin/perl 
use strict;
use warnings;

use ExtUtils::Installed;
my $ei = ExtUtils::Installed->new;

my $dictfile = "$ENV{HOME}/.vim/dict/perl_modules.dict";
my @words = ();
my @extwords = qw/Dumper/;

push @words, $_ for $ei->modules;
push @words, @extwords;

open my $fh, ">", $dictfile;
print $fh join("\n",sort { $a cmp $b } @words);  
close $fh;

