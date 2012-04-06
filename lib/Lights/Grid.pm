package Lights::Grid;

use strict;
use warnings;
use Lights::Slot;
use Carp;

sub new {
        my ($class, $width, $height) = @_;
        my $self = bless {
                w => $width // 1,
                h => $height // 1,
                grid => undef,
        }, $class;

        $self->create;

        return $self;
}

sub w    { shift->{'w'} }
sub h    { shift->{'h'} }
sub grid { shift->{'grid'} }

sub click {
        my ($self, $x, $y) = @_;
        
        carp "x [$x] is out of range" unless ($x >= 0 && $x < $self->w);
        carp "y [$y] is out of range" unless ($y >= 0 && $y < $self->h);
        $self->slot($x,$y)->switch;

        $self->slot($x-1,$y)->switch if ($x > 0);
        $self->slot($x+1,$y)->switch if ($x+1 < $self->w);
        $self->slot($x,$y-1)->switch if ($y > 0);
        $self->slot($x,$y+1)->switch if ($y+1 < $self->h);

        return $self;
}

sub slot {
        my ($self,$x,$y) = @_;
        return $self->grid->[$y]->[$x];
}

sub create {
        my $self = shift;

        my $grid = [];
        for my $y (0 .. $self->h-1) {
        for my $x (0 .. $self->w-1) {
                $grid->[$y]->[$x] = Lights::Slot->new($x,$y,0);                
        }
        }
        $self->{'grid'} = $grid;

        return $self;
}

# to draw something in ascii.
sub draw {
        my $self = shift;

        my $top_bottom_line = "+". "-" x ($self->w *2 -1) . "+\n";
        print $top_bottom_line;
        for my $y (0 .. $self->h-1) {
                for my $x (0 .. $self->w-1) {
                        my $l = $self->grid->[$y]->[$x]->light ? '#' : ' ';
                        print "|$l";
                }
                print "|\n";
        }
        print $top_bottom_line;

        return $self;
}

1;
