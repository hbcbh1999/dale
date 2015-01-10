#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/enum-cast.dt -o enum-cast  `;
is(@res, 0, 'No compilation errors');

@res = `./enum-cast`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ qw(0 3) ], 'Got expected results');

`rm enum-cast`;

1;
