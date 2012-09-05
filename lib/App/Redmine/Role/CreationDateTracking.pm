package App::Redmine::Role::CreationDateTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::AppRedmine qw(RedmineDateTime);

# ABSTRACT:  Creation Date tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

has created_on                    => (
	isa       => RedmineDateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_creation_date',
	writer    => 'set_created_on',
	lazy      => 0,
	coerce    => 1,
);

#### Consumed Roles ####

with qw(App::Redmine::Role::DateTracking);

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::CreationDateTracking';
	}

	my $thing = Thing->new( created_on => '2012/01/01 10:00:00 -0600' );

	if ( $thing->has_creation_date() ) {
		$thing->created_on();
	}
	else {
		$thing->set_created_on( '2012/08/03 23:17:25 -0500' );
	}

=DESCRIPTION

L<App::Redmine::Role::CreationDateTracking> provides consumers with attributes and methods pertaining to tracking creation dates.

=attr created_on

Entity creation date

=cut
