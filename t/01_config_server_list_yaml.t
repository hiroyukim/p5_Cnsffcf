use strict;
use Test::More;
use File::Spec;
use File::Basename;
use Cnsffcf::Config::ServerList;

my $config_file_path   = File::Spec->rel2abs(File::Spec->catfile(dirname(__FILE__),'server_list.yaml'));
my $config_server_list = Cnsffcf::Config::ServerList->new({ config_file_path => $config_file_path });

ok $config_server_list;

for my $row ( @{$config_server_list->all()} ) {
    isa_ok($row,'Cnsffcf::Config::ServerList::Schema::All');
    can_ok($row,qw/ip roles hostname groupname is_role/);
    cmp_ok($row->hostname(),'eq', $row->roles->[0]);
    cmp_ok($row->groupname(),'eq', $row->roles->[1]);
    if( $row->groupname() eq 'cache' ) {
        ok( $row->is_role('cache') );
    }
}

done_testing;
