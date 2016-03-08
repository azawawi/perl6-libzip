#!/usr/bin/env perl6

use v6;

use lib 'lib';
use NativeCall;
use LibZip;

constant LIB = 'libzip.so';


class ZipFile {
  has Pointer[zip] $.archive;

  #open("", :$w)
}

my $errorp;
my Pointer[zip] $handle = zip_open("test.zip", ZIP_CREATE, $errorp);
say $handle;
say $errorp;


my $data= "Hello world";
say $data.chars;
my  $source = zip_source_buffer($handle, $data, $data.chars, 0);
say $source;

=begin code
my $ret;
$ret = zip_add($handle, "lib", $source);

say $ret;

$ret = zip_close($handle);
say $ret;
=end code
