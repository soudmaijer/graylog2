#
# Cookbook Name:: graylog2
# Recipe:: server-only
#
# Copyright (C) 2014, Oudmaijer IT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "ark"

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
  source "graylog2-server.conf.erb"
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

