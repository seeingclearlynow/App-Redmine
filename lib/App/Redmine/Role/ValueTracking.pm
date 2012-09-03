package App::Redmine::Role::ValueTracking;

use 5.010;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::Moose qw(Int);

# ABSTRACT:  Value tracking for App::Redmine fields
# VERSION

has id      => (
	isa       => Int,
	is        => 'ro',
	required  => 1,
	lazy      => 0,
);

has name    => (
	isa       => Str,
	is        => 'ro',
	required  => 1,
	lazy      => 0,
);

1;

=pod

=head1 SYNOPSIS

	{
	package Thing;

	use Moose;

	with 'App::Redmine::Role::ValueTracking;
	}

	my $field = Thing->new( id => 582, name => 'blah' );

	$field->id();
	$field->set_id( 4 );

	$field->name();
	$field->set_name( 'blah' );

=head1 DESCRIPTION

L<App::Redmine::Role::ValueTracking> provides consumers with attributes and methods pertaining to tracking value.

=attr id

The numeric identifier for the field

	$field->id(); # get the id
	$field->set_id( 3 ); # set the id

=attr name

The name identifier for the field.

	$field->name(); # get the name
	$field->set_name( 'blah' ); # set the name

=cut
