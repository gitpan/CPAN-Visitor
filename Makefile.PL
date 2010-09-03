
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Generic traversal of distributions in a CPAN repository',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'CPAN-Visitor',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'CPAN::Visitor',
  'PREREQ_PM' => {
    'Archive::Extract' => '0.34',
    'File::Find' => '0',
    'File::Temp' => '0.20',
    'File::pushd' => '1.00',
    'Moose' => '0.93',
    'MooseX::Params::Validate' => '0.13',
    'Parallel::ForkManager' => '0.007005',
    'Path::Class' => '0.17',
    'autodie' => '0',
    'namespace::autoclean' => '0.09'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



