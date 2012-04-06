package Lights::Wx::Frame;

use strict;
use warnings;
use base 'Wx::Frame';
use Wx::Event qw/EVT_BUTTON/;
use Lights::Wx::Button;
use Carp;

sub new {
        my $class = shift;
        my $grid  = shift;

        croak "$class need a Lights::Grid arg" unless $grid->isa('Lights::Grid');

        my $self = $class->SUPER::new(
                undef, -1,
                'Perl Lights Out!',
                [-1,-1], [200,200],
        );

        my $panel = Wx::Panel->new(
                $self,  # parent
                -1,     # any ID
        );

        $self->{grid} = $grid;
        $self->{buttons} = [];

        my %size = (x => 30, y => 30);

        for my $j (0 .. $grid->h-1) {
        for my $i (0 .. $grid->w-1) {
                my %pos = (
                        x => $i * ($size{'x'} +1),
                        y => $j * ($size{'y'} +1),
                );

                my $slot_ref = $self->grid->slot($i,$j);

                my $button = Lights::Wx::Button->new(
                        $slot_ref,
                        $panel, -1, $slot_ref->light,
                        [ $pos{'x'}, $pos{'y'} ],
                        [$size{'x'}, $size{'y'}],
                );
                push @{$self->{buttons}}, $button;

                EVT_BUTTON($self, $button, sub { $self->click($i,$j); } );
        }
        }

        return $self;
}

sub grid    { shift->{grid} }
sub buttons { @{shift->{buttons}} }

# re-draw all the buttons
sub draw {
        my $self = shift;
        $_->draw for $self->buttons;
        return $self;
}

sub click {
        my ($self, $x,$y) = @_;

        $self->grid->click($x,$y);
        # warn $self->{grid}->draw ."\n"; # debug

        $self->draw;
        return $self;
}

1;
