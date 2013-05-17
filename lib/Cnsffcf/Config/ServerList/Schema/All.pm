package Cnsffcf::Config::ServerList::Schema::All;
use Mouse;

has 'ip' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'roles' => (
    is       => 'ro',
    isa      => 'ArrayRef',
    required => 1,
);

sub groupname {
    $_[0]->roles->[1];
}

sub hostname {
    $_[0]->roles->[0];
}

sub is_role {
    my ($self,$role) = @_;
    ( grep { $_ eq $role } @{$self->{roles}} ) ;
}

1;
