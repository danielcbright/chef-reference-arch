# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'ymir-base'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'ymir-base::default'

# Specify a custom source for a single cookbook:
cookbook 'ymir-base', path: '.'
cookbook 'attributes-loader', path: '../attributes-loader'
cookbook 'audit', github: 'chef-cookbooks/audit', branch: 'master' #, tag: 'v9.5.0'
cookbook 'os-hardening', github: 'dev-sec/chef-os-hardening', branch: 'master' #, tag: 'v4.0.0'