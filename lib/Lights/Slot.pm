package Lights::Slot;

use strict;
use warnings;

sub new {
        my ($class,$x,$y,$light) = @_;
        bless {
                x     => $x // 0,
                y     => $y // 0,
                light => $light // 0,
        }, $class;
}

sub x { shift->{'x'} }
sub y { shift->{'y'} }

sub light { shift->{light} }

sub switch {
        my $self = shift;
        if ($self->light) {
                $self->{light} = 0;
        } else {
                $self->{light} = 1;
        }
        return $self;
}

1;
