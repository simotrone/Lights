package Lights::Wx::Button;

use strict;
use warnings;
use base 'Wx::Button';
#use Wx::Event qw/EVT_BUTTON/;
use Wx qw/wxWHITE wxLIGHT_GREY wxBLACK/;

sub new {
        my $class = shift;
        my $slot_ref = shift;

        my $self = $class->SUPER::new(@_);

        $self->{slot} = $slot_ref;

        return $self;
}

sub slot { shift->{slot} }

sub draw {
        my $self = shift;

        my $curr = $self->slot->light;

        if ($curr) {
                $self->SetBackgroundColour(wxWHITE);
        } else {
                $self->SetBackgroundColour(wxLIGHT_GREY);
        }

        $self->SetTitle($curr);

        return $self;
}

# don't need
#sub click {
#        my $self = shift;
#        $self->slot->switch;
#        return $self;
#}

1;
