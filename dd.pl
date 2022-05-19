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

exit(0);

# MIT License
# 
# Copyright (c) 2022 Little Green
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
