#!/usr/bin/env perl6

use v6;

use lib 'lib';
use NativeCall;
use LibZip;

my $ret;

my $zip-file-name = "test.zip";
$zip-file-name.IO.unlink;

my $errorp;
my Pointer[zip] $handle = zip_open($zip-file-name, ZIP_CREATE, $errorp);
die "Failed: $errorp!" unless $handle;

my $filename = "README.md";
my $source = zip_source_file($handle, $filename, 0, -1);
die "Failed!" unless $source;

$ret = zip_add($handle, $filename.IO.basename, $source);
say $ret;
die "Failed" if $ret == -1;

$ret = zip_close($handle);
die "Failed" if $ret != ZIP_ER_OK;
