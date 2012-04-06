#!/usr/bin/perl

use FindBin;
use lib "$FindBin::Bin/../lib";
use Lights::Grid;
use Lights::Reducer;

for my $i (1 .. 5) {
        my $g = Lights::Grid->new(5,5);

        $g->click($_,0) for (0 .. $i-1);
        #$g->draw;

        my $r = Lights::Reducer->new($g)->reduce;
        # $g->draw;

        print "1" x $i , "0" x (5-$i) ," => ", $r->last_row ,"\n";
}


