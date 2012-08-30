package App::Redmine::Role::ProgressTracking;

use 5.010;
use strict;
use warnings;

use Moose::Role;
use MooseX::Types::Common::String qw(NonEmptySimpleStr);

# ABSTRACT:  Progress tracking role for App::Redmine entities
# VERSION

#### Object Attributes ####

has status                        => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_status',
	writer    => 'set_status',
	lazy      => 0,
);

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::ProgressTracking';
	}

	my $thing = Thing->new();

	$thing->status();
	$thing->set_status( 'closed' );

=DESCRIPTION

L<App::Redmine::Role::ProgressTracking> provides consumers with attributes and methods pertaining to tracking progress.

=attr status

Status of the issue

=cut
