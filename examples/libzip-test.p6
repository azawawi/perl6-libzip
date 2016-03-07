#!/usr/bin/env perl6

use v6;

use lib 'lib';
use LibZip;

constant LIB = 'libzip.so';

my $errorp;
my $handle = zip_open("test.zip", ZIP_CREATE, $errorp);
my $ret = zip_close($handle);
say $ret;
