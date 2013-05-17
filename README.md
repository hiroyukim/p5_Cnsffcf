# NAME

Cnsffcf -- create nagios servers file from cloudforecast/conf/server_list.yaml. 

# SYNOPSIS

    carton install
    carton exec -- ./bin/create_nagios_servers_file_from_cloudforecast.pl --server_list_yaml_path /path/to/cloudforecast/conf/server_list.yaml --rules_yaml_path /path/to/rules.yaml 

    # server_list.yaml
    ---
    load_balancer:
    - check_command: check_ping!100.0,20%!500.0,60%
      service_description: PING

    # rules.yaml
    ---
    load_balancer:
    - check_command: check_ping!100.0,20%!500.0,60%
      service_description: PING

# LICENSE

Copyright (C) hiroyuki yamanaka.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

hiroyukim <hiroyukimm at kuu ki yon de>
