# Use this file to pull in attributes from data bags, default attributes should
# still be defined in the /attributes/default.rb file, this recipe will pull in
# attributes defined in a standardized set of "attribute data bags".

# Define data bags here, 
# dbags = ['global', '<appstack name>', node.policy_name]

include_recipe 'attributes-loader::default'