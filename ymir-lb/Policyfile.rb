# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'ymir-lb'

# Where to find external cookbooks:
default_source :supermarket

include_policy 'ymir-base', policy_name: 'ymir-base', policy_group: 'unstable', server: 'https://automate.dbright.io/organizations/dbright'

# run_list: chef-client will run these recipes in the order specified.
run_list 'ymir-lb::default'

# Specify a custom source for a single cookbook:
cookbook 'ymir-lb', path: '.'
cookbook 'nginx', github: 'sous-chefs/nginx', branch: 'master'
