package App::Redmine::Status;

use 5.010;
use strict;
use warnings;
use namespace::autoclean;

use Moose;

# ABSTRACT:  Status field in the Redmine system
# VERSION

with qw(App::Redmine::Role::ValueTracking);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Status;

	my $status = App::Redmine::Status->new( id => 2, name => 'Open' );

	$status->id();
	$status->set_id( 1 );

	$status->name();
	$status->set_name( 'New' );

=head1 DESCRIPTION

L<App::Redmine::Status> represents a status value field in the Redmine system.

=attr id

The numeric identifier for the status field

	$status->id(); # get the id
	$status->set_id( 1 ); # set the id

=attr name

The name identifier for the status field

	$status->id(); # get the name
	status->set_name( 'New' ); # set the name

=cut
