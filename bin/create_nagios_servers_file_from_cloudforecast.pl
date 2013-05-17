#!/bin/env perl
use strict;
use warnings;
use File::Spec;
use File::Basename;
use lib File::Spec->rel2abs(File::Spec->catfile(dirname(__FILE__), '..','lib',));
use opts;
use Text::Xslate;
use Cnsffcf::Config::ServerList; 
use Cnsffcf::Config::Rules; 
use Cnsffcf::View; 

opts 
    my $server_list_yaml_path  => { isa => 'Str', required => 1 },
    my $rules_yaml_path        => { isa => 'Str', required => 1 };

sub run {
    print Cnsffcf::View->render(
        File::Spec->rel2abs(File::Spec->catfile(dirname(__FILE__), '..','tmpl',)) => 'servers.tx' => +{
            config_rules       => Cnsffcf::Config::Rules->new({      config_file_path => $rules_yaml_path       }),
            config_server_list => Cnsffcf::Config::ServerList->new({ config_file_path => $server_list_yaml_path }),
        },
    );
}

run() && exit();
