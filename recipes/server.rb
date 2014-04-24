#
# Cookbook Name:: graylog2
# Recipe:: server
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
include_recipe "java"

# mongo single instance
include_recipe "mongodb::10gen_repo"
include_recipe "mongodb::default"

# elasticsearch, clustername set in override attributes
include_recipe "elasticsearch"
include_recipe "elasticsearch::plugins"

include_recipe "graylog2::server"