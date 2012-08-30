#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

use Class::Load 0.20 qw(load_class);
use Test::More;
use Test::Moose;

my $api_key      = $ENV{REDMINE_API_KEY};
my $base_url     = $ENV{REDMINE_BASE_URL};

plan skip_all =>
	'No configuration set. Please set REDMINE_API_KEY and REDMINE_BASE_URL'
	. ' in the environment to run this test.'
	unless $api_key && $base_url;

my $class    = 'App::Redmine::Issue';
my $methods  = [ qw(id description status) ];
my $roles    = [ qw(
	App::Redmine::Role::IdentityTracking
	App::Redmine::Role::ProgressTracking
) ];

my $data     = {
	id          => 1,
	description => 'This is a test issue.',
	status      => 'new',
};

my $object   = new_ok load_class( $class ), [ $data ];

can_ok  $object, map { $_, "set_$_" } @$methods;

does_ok $class, $_ foreach ( @$roles );

is      $object->id(),          $data->{id},          'id matches';
is      $object->description(), $data->{description}, 'description matches';
is      $object->status(),      $data->{status},      'status matches';

$data->{id}          = 5;
$data->{description} = "Things, things, and more things.\n\nThere are lots of things for everyone.";
$data->{status}      = 'open';

$object->set_id( $data->{id} );
$object->set_description( $data->{description} );
$object->set_status( $data->{status} );

is      $object->id(), $data->{id}, 'id was updated successfully';
is      $object->description(), $data->{description}, 'description was updated successfully';
is      $object->status(), $data->{status}, 'status was updated successfully';

done_testing;
