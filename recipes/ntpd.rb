#
# Cookbook Name:: monitor
# Recipe:: ntpd
#
# Copyright 2014, Bill Fraser
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

include_recipe "monitor::_graphite_plugin"

sensu_check "ntpd" do
  command "check-data.rb -a :::graphite.age::: -s :::graphite.server::: -t :::ntpd.offset.target::: -w :::ntpd.offset.warning::: -c :::ntpd.offset.critical:::"
  handlers ["default"]
  standalone true
  interval 30
end
