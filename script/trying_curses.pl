#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::RealBin/../lib";
use Lights::Grid;
use Curses::UI;

my $cui = new Curses::UI( -color_support => 1 );

my $win1 = $cui->add(
        'main', 'Window',
        -border => 1,
);

my %slot = ( border => 1, width => 4, height => 2);

for my $j (0 .. 4) {
for my $i (0 .. 4) {
        my $x = $i * ($slot{width}  + $slot{border});
        my $y = $j * ($slot{height} + $slot{border});
        my $win_grid = $win1->add(
                "grid_$i-$y", 'Window',
                -border => $slot{border},
                -width  => $slot{width},
                -height => $slot{height},
                -x => $x,
                -y => $y,
        );
}
}


sub exit { exit(0) }

$cui->set_binding( \&exit , "\cQ" );
$cui->mainloop();
