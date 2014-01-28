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

group node[:graylog2][:server_group] do
  action :create
end

user node[:graylog2][:server_user] do
  group node[:graylog2][:server_group]
  supports :manage_home => true
  comment "Graylog2 server user"
  action :create
end

ark 'graylog2-server' do
  url node[:graylog2][:server_package]
  home_dir node[:graylog2][:server_home]
  owner node[:graylog2][:server_user]
  group node[:graylog2][:server_group]
end

# Create graylog2.conf
template "/etc/graylog2.conf" do
  mode 0644
  notifies :restart, "service[graylog2-server]"
end

# Create init.d script
template "/etc/init.d/graylog2-server" do
  source "graylog2-server.init.erb"
  mode 0755
  notifies :restart, "service[graylog2-server]", :delayed
end

# Service resource
service "graylog2-server" do
  supports :restart => true, :status => true
  action :enable
end

