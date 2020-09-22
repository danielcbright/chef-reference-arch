template '/etc/sysctl.conf' do
  source 'sysctl.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

sysctl 'vm.overcommit_memory' do
  value node.default['sysctl']['vm.overcommit_memory']
end

include_recipe 'redisio::default'