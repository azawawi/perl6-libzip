#!/usr/bin/env perl6

use v6;

use lib 'lib';
use LibZip;

# Remove the old one (just in case)
my $zip-file-name = "test.zip";
$zip-file-name.IO.unlink;

# Create a new LibZip instance
my $archive = LibZip.new;

# Create a new zip file
$archive.open($zip-file-name);

# Add file to zip archive
$archive.add-file("README.md");

# Add file to zip archive
my @buffer;
$archive.add-buffer("Hello.txt", @buffer);

# Close the zip archive
$archive.close;