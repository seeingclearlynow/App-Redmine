package App::Redmine::Role::IdentityTracking;

use 5.010;
use strict;
use warnings;

use Moose::Role;
use MooseX::Types::Moose qw(Int Str);

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

has description                   => (
	isa       => Str,
	is        => 'rw',
	required  => 0,
	predicate => 'has_description',
	writer    => 'set_description',
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

	$thing->description();
	$thing->set_description( 'blah, blah, blah...' );

=DESCRIPTION

L<App::Redmine::Role::IdentityTracking> provides consumers with attributes and methods pertaining to tracking identity.

=attr id

Numeric id of the entity

=attr description

Description of the entity

=cut
