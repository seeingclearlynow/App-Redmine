package App::Redmine::Entity;

use 5.010;
use strict;
use warnings;

use Moose;

# ABSTRACT:  Generic entity in the Redmine system
# VERSION

#### Object Attributes ####

has parent => (
	isa       => 'App::Redmine::Entity',
	is        => 'rw',
	required  => 0,
	predicate => 'has_parent',
	writer    => 'set_parent',
	lazy      => 0,
);

#### Consumed Roles ####

with qw(
	App::Redmine::Role::IdentityTracking
);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Entity;

	my $entity = App::Redmine::entity->new( id => 582 );

=head1 DESCRIPTION

L<App::Redmine::Entity> represents an entity in the Redmine system.

=head1 Consumed Roles

=over 4

=item L<App::Redmine::Role::IdentityTracking>

=back

=cut
