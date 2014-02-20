#
# Cookbook Name:: graylog2
# Recipe:: server
#
# Copyright (C) 2014
#
# All rights reserved - Do Not Redistribute
#
include_recipe "ark"
include_recipe "java"

# mongo single instance
include_recipe "mongodb::10gen_repo"
include_recipe "mongodb::default"

# elasticsearch, clustername set in override attributes
include_recipe "elasticsearch"
include_recipe "elasticsearch::plugins"

graylog2_server_service_name='graylog2-server'
graylog2_server_package = "https://github.com/Graylog2/graylog2-server/releases/download/#{node[:graylog2][:server_version]}/graylog2-server-#{node[:graylog2][:server_version]}.tgz"

group node[:graylog2][:server_group] do
  action :create
end

user node[:graylog2][:server_user] do
  group node[:graylog2][:server_group]
  supports :manage_home => true
  comment "#{graylog2_server_service_name} user"
  action :create
end

ark "#{graylog2_server_service_name}" do
  url graylog2_server_package
  home_dir node[:graylog2][:server_home]
  version node[:graylog2][:server_version]
  owner node[:graylog2][:server_user]
  group node[:graylog2][:server_group]
  notifies :restart, "service[#{graylog2_server_service_name}]", :delayed
end

# Create graylog2.conf
template "/etc/graylog2.conf" do
  mode 0644
  notifies :restart, "service[#{graylog2_server_service_name}]", :delayed
end

# Create init.d script
template "/etc/init.d/#{graylog2_server_service_name}" do
  source "graylog2-server.init.erb"
  mode 0755
  notifies :restart, "service[#{graylog2_server_service_name}]", :delayed
end

# Service resource
service "#{graylog2_server_service_name}" do
  supports :restart => true, :status => true
  action :enable
end

