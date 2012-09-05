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

my $class    = 'App::Redmine::User';
my $methods  = [ qw(first_name last_name mail last_login_on created_on) ];
my $roles    = [ qw(
	App::Redmine::Role::IdentityTracking
	App::Redmine::Role::LoginDateTracking
	App::Redmine::Role::CreationDateTracking
) ];

my $data     = {
	id            => 1,
	first_name    => 'Test',
	last_name     => 'User',
	mail          => 'test.user@example.com',
	last_login_on => '2012/09/03 12:00:00 -0500',
	created_on    => '2012/01/01 08:00:00 -0500',
};

my $object   = new_ok load_class( $class ), [ $data ];

can_ok  $object, 'id', @$methods, map { $_, "set_$_" } @$methods;

does_ok $class, $_ foreach ( @$roles );

is      $object->id(),            $data->{id},            'id matches';
is      $object->first_name(),    $data->{first_name},    'first_name matches';
is      $object->last_name(),     $data->{last_name},     'last_name matches';
is      $object->mail(),          $data->{mail},          'mail matches';
is      $object->last_login_on(), $data->{last_login_on}, 'last_login_on matches';
is      $object->created_on(),    $data->{created_on},    'created_on matches';

$data->{id}            = 5;
$data->{first_name}    = 'Tom';
$data->{last_name}     = 'Smith';
$data->{mail}          = 'tom.smith@example.com';
$data->{last_login_on} = '2012/04/03 23:02:59 -0500';
$data->{created_on}    = '2012/01/29 11:50:00 -0500';

$object->set_id( $data->{id} );
$object->set_first_name( $data->{first_name} );
$object->set_last_name( $data->{last_name} );
$object->set_mail( $data->{mail} );
$object->set_last_login_on( $data->{last_login_on} );
$object->set_created_on( $data->{created_on} );

is      $object->id(),            $data->{id},            'id was updated successfully';
is      $object->first_name(),    $data->{first_name},    'first_name was updated successfully';
is      $object->last_name(),     $data->{last_name},     'last_name was updated successfully';
is      $object->mail(),          $data->{mail},          'mail was updated successfully';
is      $object->last_login_on(), $data->{last_login_on}, 'last_login_on was updated successfully';
is      $object->created_on(),    $data->{created_on},    'created_on was updated successfully';

done_testing;
