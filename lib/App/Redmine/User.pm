package App::Redmine::User;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose;
use MooseX::StrictConstructor;
use MooseX::Types::Email qw(EmailAddress);
use MooseX::Types::Common::String qw(NonEmptySimpleStr);

# ABSTRACT:  User entity in the Redmine system
# VERSION

#### Object Attributes ####

has first_name    => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_first_name',
	writer    => 'set_first_name',
	lazy      => 0,
);

has last_name     => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_last_name',
	writer    => 'set_last_name',
	lazy      => 0,
);

has mail          => (
	isa       => EmailAddress,
	is        => 'rw',
	required  => 0,
	predicate => 'has_mail',
	writer    => 'set_mail',
	lazy      => 0,
);

#### Consumed Roles ####

with qw(
	App::Redmine::Role::IdentityTracking
	App::Redmine::Role::CreationDateTracking
	App::Redmine::Role::LoginDateTracking
);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::User;

	my $user = App::Redmine::User->new( id => 12 );

=head1 DESCRIPTION

L<App::Redmine::User> represents a user entity in the Redmine system.

=head1 Consumed Roles

=item L<App::Redmine::Role::IdentityTracking>

=item L<App::Redmine::Role::DateTracking>

=over 4

=back

=cut
