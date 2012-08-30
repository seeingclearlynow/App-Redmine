package App::Redmine::Project;

use 5.010;
use strict;
use warnings;

use Moose;

# ABSTRACT:  Project entity in the Redmine system
# VERSION

extends 'App::Redmine::Entity';

1;

=pod

=head1 SYNOPSIS

	use App::Redmine::Project;

	my $project = App::Redmine::Project->new( id => 582 );

=head1 DESCRIPTION

L<App::Redmine::Project> represents a project entity in the Redmine system.

=cut
