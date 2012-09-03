package App::Redmine::Priority;

use 5.010;
use strict;
use warnings;
use namespace::autoclean;

use Moose;

# ABSTRACT:  Priority field in the Redmine system
# VERSION

extends 'App::Redmine::Field';

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Priority;

	my $priority = App::Redmine::Priority->new( id => 2, name => 'normal' );

	$priority->id();
	$priority->set_id( 1 );

	$priority->name();
	$priority->set_name( 'high' );

=head1 DESCRIPTION

L<App::Redmine::Priority> represents a priority value field in the Redmine system.

=attr id

The numeric identifier for the priority field

	$priority->id(); # get the id
	$priority->set_id( 1 ); # set the id

=attr name

The name identifier for the priority field

	$priority->id(); # get the name
	$priority->set_name( 1 ); # set the name

=cut
