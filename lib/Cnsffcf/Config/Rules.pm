package Cnsffcf::Config::Rules;
use Mouse;
extends 'Cnsffcf::Config::Base';

sub load { YAML::XS::LoadFile($_[0]->config_file_path)  }


__PACKAGE__->meta->make_immutable();
1;
