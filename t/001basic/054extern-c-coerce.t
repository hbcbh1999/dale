#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/extern-c-coerce.dt -o extern-c-coerce `;
is(@res, 0, 'No compilation errors');

@res = `./extern-c-coerce`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ '1', '2' ], 'Got expected results');

`rm extern-c-coerce`;

1;
