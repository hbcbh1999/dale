#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/concept-force.dt -o concept-force `;
is(@res, 0, 'No compilation errors');

@res = `./concept-force`;
is($?, 0, 'Program executed successfully');
chomp for @res;
is_deeply(\@res, [
    '2'
], 'Got expected results');

`rm concept-force`;

1;
