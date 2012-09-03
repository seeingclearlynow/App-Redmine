package App::Redmine::Field;

use 5.010;
use strict;
use warnings;
use namespace::autoclean;

use Moose;
use MooseX::Types::Moose qw(Int);

# ABSTRACT:  Value field in the Redmine system
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

	use App::Redmine::Field;

	my $field = App::Redmine::Field->new( id => 582, name => 'blah' );

=head1 DESCRIPTION

L<App::Redmine::Field> represents a value field in the Redmine system.

=attr id

this is the numeric identifier for the field.

=attr name

This is the name identifier for the field.

=cut
