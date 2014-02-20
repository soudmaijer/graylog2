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

graylog2_web_service_name='graylog2-web-interface'
graylog2_web_package = "https://github.com/Graylog2/graylog2-web-interface/releases/download/#{node[:graylog2][:web_version]}/graylog2-web-interface-#{node[:graylog2][:web_version]}.tgz"

group node[:graylog2][:web_group] do
  action :create
end

user node[:graylog2][:web_user] do
  group node[:graylog2][:web_group]
  supports :manage_home => true
  comment "#{graylog2_web_service_name} user"
  action :create
end

ark "#{graylog2_web_service_name}" do
  url graylog2_web_package
  home_dir node[:graylog2][:web_home]
  version node[:graylog2][:web_version]
  owner node[:graylog2][:web_user]
  group node[:graylog2][:web_group]
  notifies :start, "service[#{graylog2_web_service_name}]", :delayed
end

template File.join(node[:graylog2][:web_home], "conf/#{graylog2_web_service_name}.conf") do
  source "graylog2-web-interface.conf.erb"
  owner node[:graylog2][:web_user]
  group node[:graylog2][:web_group]
  mode 00644
  notifies :restart, "service[#{graylog2_web_service_name}]", :delayed
end

template File.join(node[:graylog2][:web_home], "conf/application.conf") do
  source "application.conf.erb"
  owner node[:graylog2][:web_user]
  group node[:graylog2][:web_group]
  mode 00644
  notifies :restart, "service[#{graylog2_web_service_name}]", :delayed
end

template "/etc/init.d/#{graylog2_web_service_name}" do
  source "graylog2-web-interface.init.erb"
  owner "root"
  group "root"
  mode  "0755"
  notifies :restart, "service[#{graylog2_web_service_name}]", :delayed
end

service "#{graylog2_web_service_name}" do
  supports :restart => true, :status => false, :reload => false
  action :enable
end