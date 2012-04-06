package Lights::Wx::App;

use strict;
use warnings;
use base 'Wx::App';
use Lights::Wx::Frame;
use Lights::Grid;

my $lights_grid = Lights::Grid->new(5,5);

sub OnInit {
        my $frame = Lights::Wx::Frame->new($lights_grid);
        $frame->Show(1);
}

1;
