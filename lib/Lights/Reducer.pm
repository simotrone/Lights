package Lights::Reducer;

use strict;
use warnings;
use Carp;

sub new {
        my ($class,$grid) = @_;
        croak __PACKAGE__." needs a Lights::Grid arg." unless $grid->isa('Lights::Grid');
        bless {
                grid => $grid,
        }, $class;
}

sub grid { shift->{grid} }

sub reduce_row {
        my ($self, $row) = @_;
        croak "No good row arg. [0,height-1[" unless ($row >= 0 && $row < $self->grid->h-1);

        for my $x (0 .. $self->grid->w-1) {
                $self->grid->click($x,$row+1) if $self->grid->slot($x,$row)->light
        }
        return $self;
}

sub reduce {
        my $self = shift;
        $self->reduce_row($_) for (0 .. $self->grid->h-2);
        return $self;
}

sub last_row {
        my $self = shift;
        $self->reduce;
        my $str = '';
        $str .= $self->grid->slot($_,$self->grid->h-1)->light for (0 .. $self->grid->w-1);
        return $str;
}

1;
