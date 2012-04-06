#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Wx;
use Lights::Wx::App;

my %table = (
        width  => 5,
        height => 5,
);
my $cell_side = 30;

my $app = Lights::Wx::App->new();

$app->MainLoop;
