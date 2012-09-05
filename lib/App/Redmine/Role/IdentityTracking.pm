package App::Redmine::Role::IdentityTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::Moose qw(Int);

# ABSTRACT:  Identity tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

has id                            => (
	isa       => Int,
	is        => 'rw',
	required  => 0,
	predicate => 'has_id',
	writer    => 'set_id',
	lazy      => 0,
);

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::IdentityTracking';
	}

	my $thing = Thing->new( id => 592 );

	$thing->id();
	$thing->set_id( 5 );

=DESCRIPTION

L<App::Redmine::Role::IdentityTracking> provides consumers with attributes and methods pertaining to tracking identity.

=attr id

Numeric id of the entity

=cut
