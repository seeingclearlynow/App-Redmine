package App::Redmine::Role::DateTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;

# ABSTRACT:  Date tracking for App::Redmine entities
# VERSION

#### Method Modifiers ####

around [ 'created_on', 'last_login_on' ] => sub {
	my ( $orig, $self, @args ) = @_;
	my $date                   = $self->$orig( @args );
	my $tz                     = $date->time_zone();
	my $value                  = $date->ymd( '/' )
		. ' '
		. $date->hms()
		. ' '
		. $tz->offset_as_string( $tz->offset_for_datetime( $date ) );

	return $value;
};

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::DateTracking';
	}

	my $thing = Thing->new();

=DESCRIPTION

L<App::Redmine::Role::DateTracking> provides consumers with attributes and methods pertaining to tracking identity.

=cut
