#
# Cookbook Name:: graylog2
# Recipe:: web-interface
#
# Copyright (C) 2014
#
# All rights reserved - Do Not Redistribute
#
include_recipe "ark"
include_recipe "java"

group node[:graylog2][:web_group] do
  action :create
end

user node[:graylog2][:web_user] do
  group node[:graylog2][:web_group]
  supports :manage_home => true
  comment "Graylog2 web-interface user"
  action :create
end

ark 'graylog2-web-interface' do
  url node[:graylog2][:web_package]
  home_dir node[:graylog2][:web_home]
  owner node[:graylog2][:web_user]
  group node[:graylog2][:web_group]
end

template File.join(node[:graylog2][:web_home], "conf/graylog2-web-interface.conf") do
  source "graylog2-web-interface.conf.erb"
  owner node[:graylog2][:web_user]
  group node[:graylog2][:web_group]
  mode 00644
end

template "/etc/init.d/graylog2-web-interface" do
  source "graylog2-web-interface.init.erb"
  owner "root"
  group "root"
  mode  "0755"
  notifies :restart, "service[graylog2-web-interface]"
end

service "graylog2-web-interface" do
  supports :restart => true, :status => true, :reload => true
  action [ :enable, :start]
end