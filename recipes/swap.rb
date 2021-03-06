#
# Cookbook Name:: monitor
# Recipe:: swap
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

sensu_check "swapin" do
  command "check-data.rb -a :::graphite.age::: -s :::graphite.server::: -t \":::swap.in.target:::\" -w :::swap.in.warning::: -c :::swap.in.critical:::"
  handlers ["default"]
  standalone true
  interval 30
end

sensu_check "swapout" do
  command "check-data.rb -a :::graphite.age::: -s :::graphite.server::: -t \":::swap.out.target:::\" -w :::swap.out.warning::: -c :::swap.out.critical:::"
  handlers ["default"]
  standalone true
  interval 30
end
