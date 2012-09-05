package App::Redmine::Priority;

use 5.008;
use strict;
use warnings;
use namespace::autoclean;

use Moose;
use MooseX::StrictConstructor;

# ABSTRACT:  Priority field in the Redmine system
# VERSION

#### Consumed Roles ####

with qw(App::Redmine::Role::ValueTracking);

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Priority;

	my $priority = App::Redmine::Priority->new( id => 2, name => 'normal' );

	$priority->id();
	$priority->name();

=head1 DESCRIPTION

L<App::Redmine::Priority> represents a priority value field in the Redmine system.

=attr id

The numeric identifier for the priority field

	$priority->id(); # get the id

=attr name

The name identifier for the priority field

	$priority->id(); # get the name

=cut
