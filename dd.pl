#!/usr/bin/perl

use strict;
use warnings;

use Fcntl qw(SEEK_SET SEEK_CUR SEEK_END);

if (! @ARGV || $#ARGV != 3) {
  print("Usage: ".$0." <input_file> <output_file> <offset> <length>\n");
  exit(0);
}

my $source_file = $ARGV[0];
my $target_file = $ARGV[1];
my $offset = $ARGV[2];
my $length = $ARGV[3];


open(my $sourcefh,'<:raw', $source_file) || die("Could not open source file ".$source_file." - ".$!);
open(my $targetfh,'>:raw', $target_file) || die("Could not write target file ".$target_file." - ".$!);
seek($sourcefh, $offset, SEEK_SET);
my $content;
my $success = read($sourcefh,$content,$length);
print $targetfh $content;
close($targetfh);
close($sourcefh);

