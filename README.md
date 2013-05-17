# NAME

Cnsffcf -- create nagios servers file from cloudforecast/conf/server_list.yaml. 

# SYNOPSIS

    carton install
    carton exec -- ./bin/create_nagios_servers_file_from_cloudforecast.pl --server_list_yaml_path /path/to/cloudforecast/conf/server_list.yaml --rules_yaml_path /path/to/rules.yaml 

    # server_list.yaml
    --- #Dev
    servers:
    - config: localhost.yaml
        label: localhost
        hosts:
        - xxx.xx.xx.xxx dev-01 dev 
        - xxx.xx.xx.xxx dev-02 dev 
        - xxx.xx.xx.xxx dev-03 dev 
    --- #Production
    servers:
    - config: mongodb.yaml
        hosts:
        - xxx.xx.xx.xxx mongodb-01 mongodb 
    - config: cache.yaml
        hosts:
        - xxx.xx.xx.xxx cache-01 cache
        - xxx.xx.xx.xxx cache-02 cache
    - config: load_balancer.yaml
        hosts:
        - xxx.xx.xx.xxx load_balancer-01 load_balancer
        - xxx.xx.xx.xxx load_balancer-02 load_balancer
        - xxx.xx.xx.xxx load_balancer-03 load_balancer
        - xxx.xx.xx.xxx load_balancer-04 load_balancer

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
