package App::Redmine::Role::DescriptionTracking;

use 5.008;
use strict;
use warnings;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

# ABSTRACT:  Description tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

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

	my $thing = Thing->new( description => 'This is a simple description' );

	$thing->description();
	$thing->set_description( 'blah, blah, blah...' );

=DESCRIPTION

L<App::Redmine::Role::DescriptionTracking> provides consumers with attributes and methods pertaining to tracking description.

=attr description

Description of the entity

=cut
