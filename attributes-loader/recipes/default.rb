#
# Cookbook:: attributes-loader
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

for dbag in node.default['attributes-loader']['dbags']
  begin
    data_bag_item(dbag, 'attributes')['all'].each do |key, value|
      if node.key?(key)
        puts "==== Attribute default is set, merging: #{dbag}:all:#{key}"
        node.default[key] = Chef::Mixin::DeepMerge.hash_only_merge(node.default[key], value)
      else
        puts "==== Attribute default is not set, not merging for: #{dbag}:all:#{key}"
      end
    end
  rescue
    puts "==== Data Bag '#{dbag}:all' not found, using default attributes"
  end
  begin
    data_bag_item(dbag, 'attributes')[node.policy_group].each do |key, value|
      if node.key?(key)
        puts "==== Attribute default is set, merging: #{dbag}:#{node.policy_group}:#{key}"
        node.default[key] = Chef::Mixin::DeepMerge.hash_only_merge(node.default[key], value)
      else
        puts "==== Attribute default is not set, not merging for: #{dbag}:#{node.policy_group}:#{key}"
      end
    end
  rescue
    puts "==== Data Bag '#{dbag}:#{node.policy_group}' not found, using default attributes"
  end
end
