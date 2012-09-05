package App::Redmine::Tracker;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose;
use MooseX::StrictConstructor;

# ABSTRACT:  Tracker field in the Redmine system
# VERSION

with qw(App::Redmine::Role::ValueTracking);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Tracker;

	my $object = App::Redmine::Tracker->new( id => 2, name => 'Feature' );

	$object->id();
	$object->name();

=head1 DESCRIPTION

L<App::Redmine::Tracker> represents a tracker value field in the Redmine system.

=attr id

The numeric identifier for the status field

	$object->id(); # get the id

=attr name

The name identifier for the status field

	$object->id(); # get the name

=cut
