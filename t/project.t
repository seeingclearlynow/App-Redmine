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

my $class    = 'App::Redmine::Project';
my $methods  = [ qw(id description) ];
my $roles    = [ qw(
	App::Redmine::Role::IdentityTracking
) ];

my $data     = { id => 1, description => "This is a test project." };
my $object    = new_ok load_class( $class ), [ $data ];

can_ok  $object, map { $_, "set_$_" } @$methods;

does_ok $class, $_ foreach ( @$roles );

is      $object->id(), $data->{id}, 'id matches';
is      $object->description(), $data->{description}, 'description matches';

$data->{id}          = 5;
$data->{description} = "Things, things, and more things.\n\nThere are lots of things for everyone.";

$object->set_id( $data->{id} );
$object->set_description( $data->{description} );

is      $object->id(), $data->{id}, 'id was updated successfully';
is      $object->description(), $data->{description}, 'description was updated successfully';

done_testing;
