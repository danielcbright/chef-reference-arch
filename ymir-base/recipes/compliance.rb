node.default['waivers']['controls'].each do |control, setting|
  inspec_waiver_file "Add waiver entry for #{control}" do
    file node.default['waivers']['file_location']
    control control
    run_test setting['run']
    justification setting['justification']
    expiration setting['expiration_date']
    action :add
  end
end

node.default['waivers']['controls_to_remove'].each do |control|
  inspec_waiver_file control do
    file node.default['waivers']['file_location']
    action :remove
  end
end

include_recipe 'os-hardening::default'
include_recipe 'audit::default'