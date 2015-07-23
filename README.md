# Puppet module: squid3

Made by Nathan Flynn

Official git repository: http://github.com/eperdeme/puppet-squid3


## USAGE - Basic management

* Install squid3 with default settings

        class { 'squid3': }

* Install a specific version of squid3 package

        class { 'squid3':
          version => '1.0.1',
        }

* Adds or configures a squid ACL

		Usage:
		  squid3::acl { 'safe_ports':
		    acl_type => 'port',
		    acl_data => '80 443 8080 9418'
		  }

* Adds or configures a squid http_access rules

		 Usage:
		  squid3::http_access { 'allow_zen_hosts':
		    order      => '10',
		    acl_access => 'allow',
		    acl_data   => 'zen_hosts'
		  }
		  
* Populate the data from hiera.

hiera.yaml
---
squid.acl: 
  safe_ports: 
    acl_data: "80 443"
    acl_type: port
  wh_hosts: 
    acl_data: 10.0.0.0/8
    acl_type: src
squid.http_access: 
  our_hosts: 
    acl_access: allow
    acl_data: our_hosts
    order: 10

create_resources(squid3::acl, $acl_hash)
create_resources(squid3::http_access, $http_access_hash)
  
* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'squid3':
          template => 'mymodules/squid3.conf.erb',
        }