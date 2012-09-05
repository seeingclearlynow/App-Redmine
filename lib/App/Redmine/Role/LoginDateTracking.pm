package App::Redmine::Role::LoginDateTracking;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose::Role;
use MooseX::Types::AppRedmine qw(RedmineDateTime);

# ABSTRACT:  Login Date tracking for App::Redmine entities
# VERSION

#### Object Attributes ####

has last_login_on                    => (
	isa       => RedmineDateTime,
	is        => 'rw',
	required  => 0,
	predicate => 'has_last_login_date',
	writer    => 'set_last_login_on',
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

		with 'App::Redmine::Role::LoginDateTracking';
	}

	my $thing = Thing->new( last_login_on => '2012/01/01 10:00:00 -0600' );

	if ( $thing->has_last_login_date() ) {
		$thing->last_login_on();
	}
	else {
		$thing->set_last_login_on( '2012/08/03 23:17:25 -0500' );
	}

=DESCRIPTION

L<App::Redmine::Role::LoginDateTracking> provides consumers with attributes and methods pertaining to tracking login dates.

=attr last_login_on

Date of last login

=cut
