#!/usr/bin/perl

use strict;
use warnings;

use lib 'lib';
use Lights::Grid;

my $g = Lights::Grid->new(5,5);
$g->draw->click(1,1)->draw->click(2,1)->draw->click(3,0)->draw->click(3,3)->draw->click(4,4)->draw->click(0,0)->draw->click(1,0)->draw;
