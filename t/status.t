#!/usr/bin/env perl

use 5.008;
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

my $class    = 'App::Redmine::Status';
my $methods  = [ qw(id name) ];
my $roles    = [ qw(App::Redmine::Role::ValueTracking) ];
my $data     = { id => 1, name => 'New' };
my $object   = new_ok load_class( $class ), [ $data ];

can_ok  $object, @$methods;
does_ok $class, $_ foreach ( @$roles );

is      $object->id(),   $data->{id},   'id matches';
is      $object->name(), $data->{name}, 'name matches';

new_ok  $class, [ $data->{id} ];
new_ok  $class, [ $data->{name} ];

done_testing;
