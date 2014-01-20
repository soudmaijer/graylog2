#
# Cookbook Name:: graylog2
# Recipe:: default
#
# Copyright (C) 2014
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"