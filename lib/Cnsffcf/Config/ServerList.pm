package Cnsffcf::Config::ServerList;
use Mouse;
extends 'Cnsffcf::Config::Base';
use List::MoreUtils qw/uniq/;
use Cnsffcf::Config::ServerList::Schema::All;

sub load {
    my $self = shift;

    my $hash = {};
    my $tmp_group;
    
    open my $fh, '<:utf8', $self->config_file_path or die $!;
    while( my $line = <$fh> ) {
        if ( $line =~ /^---\s+#(.+)$/ ) {
            $tmp_group = $1;
        }
        $hash->{$tmp_group} .= $line;
    }        
    close $fh;

    +{ map { $_ => YAML::XS::Load($hash->{$_}) } keys %$hash };
}

sub all {
    my $self = shift;
    [ 
        map {
            my $row = $_;
            my ($ip,@roles) = split(/\s+/,$_ );
            Cnsffcf::Config::ServerList::Schema::All->new(+{
                ip => $ip,
                roles => [@roles],
            });
        }
        map { @{$_->{hosts}} }
        map { 
            @{$self->data->{$_}->{servers}} 
        } keys %{$self->data}
    ];
}

sub hostgroupname_hosts_list {
    my $self = shift;

    my $hash = {};
    for my $role ( @{$self->roles()} ) {
        for my $row ( @{$self->all()} ) {
            if( $row->is_role($role) ) {
                push @{$hash->{$role}},$row->hostname();
            }
        }
    }

    return [ map +{ hostgroupname => $_ ,hosts => join(",",@{$hash->{$_}}) }, sort keys %{$hash}  ];
}

sub roles {
    my $self = shift;

    [
        sort { $a cmp $b }
        uniq 
        map { $_->groupname() }  
        @{$self->all()}
    ];
}

__PACKAGE__->meta->make_immutable();
1;
