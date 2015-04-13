#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/macros-basic.dt -o macros-basic`;
is(@res, 0, 'No compilation errors');

@res = `./macros-basic`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ 'Should be returned', '3' ],
                   'Got expected results');

`rm macros-basic`;

1;