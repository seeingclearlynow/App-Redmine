package App::Redmine::Tracker;

use 5.010;
use strict;
use warnings;
use namespace::autoclean;

use Moose;

# ABSTRACT:  Tracker field in the Redmine system
# VERSION

with qw(App::Redmine::Role::ValueTracking);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Tracker;

	my $object = App::Redmine::Tracker->new( id => 2, name => 'Feature' );

	$object->id();
	$object->set_id( 1 );

	$object->name();
	$object->set_name( 'Bug' );

=head1 DESCRIPTION

L<App::Redmine::Tracker> represents a tracker value field in the Redmine system.

=attr id

The numeric identifier for the status field

	$object->id(); # get the id
	$object->set_id( 1 ); # set the id

=attr name

The name identifier for the status field

	$object->id(); # get the name
	$object->set_name( 'Bug' ); # set the name

=cut
