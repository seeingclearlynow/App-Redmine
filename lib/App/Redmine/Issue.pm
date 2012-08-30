package App::Redmine::Issue;

use 5.010;
use strict;
use warnings;

use Moose;

# ABSTRACT:  Issue entity in the Redmine system
# VERSION

extends 'App::Redmine::Entity';

#### Object Attributes ####

has assigned_to => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_assignee',
	writer    => 'set_assigned_to',
	lazy      => 0,
);

has author => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_author',
	writer    => 'set_author',
	lazy      => 0,
);

has done_ratio => (
	isa       => Int,
	is        => 'rw',
	required  => 0,
	predicate => 'has_done_ratio',
	writer    => 'set_done_ratio',
	lazy      => 0,
);

has priority => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_priority',
	writer    => 'set_priority',
	lazy      => 0,
);

has     project => (
	isa       => 'App::Redmine::Project',
	is        => 'rw',
	required  => 0,
	predicate => 'has_project',
	writer    => 'set_project',
	lazy      => 0,
);

has     spent_hours => (
	isa       => Num,
	is        => 'rw',
	required  => 0,
	predicate => 'has_spent_hours',
	writer    => 'set_spent_hours',
	lazy      => 0,
);

has     start_date  => (
	isa       => DateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_assignee',
	writer    => 'set_assigned_to',
	lazy      => 0,
);

has     subject     => "Require Support of multiple remotes", => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_assignee',
	writer    => 'set_assigned_to',
	lazy      => 0,
);

has     tracker     => { id => 1, name => "Bug" }, => (
	isa       => NonEmptySimpleStr,
	is        => 'rw',
	required  => 0,
	predicate => 'has_assignee',
	writer    => 'set_assigned_to',
	lazy      => 0,
);

#### Consumed Roles ####

with qw(
	App::Redmine::Role::ProgressTracking
);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Issue;

	my $issue = App::Redmine::Issue->new( id => 111 );

=head1 DESCRIPTION

L<App::Redmine::Role::Issue> represents an issue entity in the Redmine system.

=head1 Consumed Roles

=over 4

=item L<App::Redmine::Role::ProgressTracking>

=back

=attr assigned_to

=cut
