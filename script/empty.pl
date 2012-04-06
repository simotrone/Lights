#!/usr/bin/perl

use FindBin;
use lib "$FindBin::Bin/../lib";
use Lights::Grid;

my $g = Lights::Grid->new(5,5);
$g->draw;
