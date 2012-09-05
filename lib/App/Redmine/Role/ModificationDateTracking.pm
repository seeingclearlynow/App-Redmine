package App::Redmine::Role::ModificationDateTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::AppRedmine qw(RedmineDateTime);

# ABSTRACT:  Modification Date tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

has updated_on                    => (
	isa       => RedmineDateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_Modification_date',
	writer    => 'set_updated_on',
	lazy      => 0,
);

#### Consumed Roles ####

with qw(App::Redmine::Role::DateTracking);

1;

=pod

=head1 SYNOPSIS

	{
		package Thing;

		use Moose;

		with 'App::Redmine::Role::ModificationDateTracking';
	}

	my $thing = Thing->new( updated_on => '2012/01/01 10:00:00 -0600' );

	if ( $thing->has_modification_date() ) {
		$thing->updated_on();
	}
	else {
		$thing->set_updated_on( '2012/08/03 23:17:25 -0500' );
	}

=DESCRIPTION

L<App::Redmine::Role::modificationDateTracking> provides consumers with attributes and methods pertaining to tracking modification dates.

=attr updated_on

Entity modification date

=cut
