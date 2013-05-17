package Cnsffcf::Config::Base;
use Mouse;
use YAML::XS;

has 'config_file_path' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'data' => (
    is       => 'rw',
    isa      => 'HashRef',
    lazy     => 1,
    default  => sub {
        $_[0]->{__data} ||= $_[0]->load();
    },
);

__PACKAGE__->meta->make_immutable();
1;
