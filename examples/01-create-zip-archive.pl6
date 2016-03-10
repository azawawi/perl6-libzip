#!/usr/bin/env perl6

use v6;

use lib 'lib';
use NativeCall;
use LibZip;

# Remove the old one (just in case)
my $zip-file-name = "test.zip";
$zip-file-name.IO.unlink;

# Create a new zip file
my $error-code;
my Pointer[zip] $handle = zip_open($zip-file-name, ZIP_CREATE, $error-code);
die "Failed: $error-code!" unless $handle;

# Prepare a zip data source
my $filename = "README.md";
my $source = zip_source_file($handle, $filename, 0, -1);
die "Failed!" unless $source;

# Add file to zip archive
my $result = zip_add($handle, $filename.IO.basename, $source);
die "Failed" if $result == -1;

# Close the zip archive
$result = zip_close($handle);
die "Failed" if $result != ZIP_ER_OK;
