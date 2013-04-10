default['chef']['version'] = '10.24.0-1'
default['chef']['install_method'] = 'omnibus'
default['chef']['parent'] = 'vagrant'
default['chef']['json'] = nil
default['chef']['solo']['config_file'] = '/etc/chef/solo.rb'
default['chef']['solo']['json_attribs_file'] = '/etc/chef/node.json'
default['chef']['solo']['json'] = false
#default['chef']['solo']['json'] = "https://raw.github.com/rightscale-blueprints/linux_server/master/examples/chef-solo/node.json"
default['chef']['dump_attributes'] = 'true'
default['chef']['dump']['run_list'] = 'true'
default['chef']['dump']['file'] = '/etc/chef/attributes.json'
default['chef']['solo']['log_file'] = '/var/log/chef-solo.log'

if node['chef']['install_method'] = 'omnibus'
  default['chef']['solo']['binary'] = '/opt/chef/bin/chef-solo'
else
  default['chef']['solo']['binary'] = 'chef-solo'
end

if node['chef']['parent'] == 'rightscale'
  cache = '/var/cache/rightscale/cookbooks/default'
  cache_subdirs = Array.new
  Dir.chdir(cache)
  Dir['*/'].each {|subdir| cache_subdirs.push("#{cache}/#{subdir}/cookbooks") }
  default['chef']['solo']['cookbook_path'] = cache_subdirs
else
  default['chef']['solo']['cookbook_path'] = [ "/var/chef/cookbooks", "/var/chef/site-cookbooks" ]
end