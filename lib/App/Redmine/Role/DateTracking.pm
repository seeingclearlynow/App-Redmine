package App::Redmine::Role::DateTracking;

use 5.010;
use strict;
use warnings;

use Moose::Role;
use MooseX::Types::DateTime qw(DateTime);

# ABSTRACT:  Date tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

has created_on                    => (
	isa       => DateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_creation_date',
	writer    => 'set_created_on',
	lazy      => 0,
);

has updated_on                    => (
	isa       => DateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_modification_date',
	writer    => 'set_updated_on',
	lazy      => 0,
);

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::DateTracking';
	}

	my $thing = Thing->new( id => 592 );

	if ( $thing->has_creation_date() ) {
		$thing->created_on();
	}
	else {
		$thing->set_created_on( '2012/08/03 23:17:25 -0500' );
	}

	if ( $thing->has_modication_date() ) {
		$thing->updated_on();
	}
	else {
		$thing->set_updated_on( '2012/08/03 23:17:25 -0500' );
	}

=DESCRIPTION

L<App::Redmine::Role::DateTracking> provides consumers with attributes and methods pertaining to tracking identity.

=attr created_on

Entity creation date

=attr updated_on

Entity modification date

=cut
