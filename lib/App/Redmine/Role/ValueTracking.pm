package App::Redmine::Role::ValueTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::Common::String qw(NonEmptySimpleStr);

# ABSTRACT:  Value tracking for App::Redmine fields
# VERSION

#### Object Attributes ####

has name    => (
	isa       => NonEmptySimpleStr,
	is        => 'ro',
	required  => 0,
	predicate => 'has_name',
	lazy      => 0,
);

#### Method Modifiers ####

around BUILDARGS => sub {
	my ( $orig, $self, @args ) = @_;

	if ( scalar @args == 1 ) {
		if ( ref $args[0] eq '' ) {
			if ( $args[0] =~ /^\d+$/x ) {
				$args[0] = {id => $args[0] };
			}
			else {
				$args[0] = { name => $args[0] };
			}
		}
	}

	return $self->$orig( @args );
};

#### Consumed Roles ####

with 'App::Redmine::Role::IdentityTracking';

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

	$field->name();

=head1 DESCRIPTION

L<App::Redmine::Role::ValueTracking> provides consumers with attributes and methods pertaining to tracking value.

=attr id

The numeric identifier for the field

	$field->id(); # get the id

=attr name

The name identifier for the field.

	$field->name(); # get the name

=cut
