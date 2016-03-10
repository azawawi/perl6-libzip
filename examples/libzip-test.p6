#!/usr/bin/env perl6

use v6;

use lib 'lib';
use NativeCall;
use LibZip;

my $ret;

my $errorp;
my Pointer[zip] $handle = zip_open("test.zip", ZIP_CREATE, $errorp);
die "Failed: $errorp!" unless $handle;

my $filename = "README.md";
my $source = zip_source_file($handle, $filename, 0, -1);

$ret = zip_add($handle, $filename.IO.basename, $source);

$ret = zip_close($handle);
say $ret;
