#
# Cookbook:: ymir-base
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'ymir-base::attributes'
include_recipe 'ymir-base::ntp'
include_recipe 'ymir-base::compliance'