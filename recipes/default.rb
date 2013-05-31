#
# Cookbook Name:: zabbix
# Recipe:: status
#
# Copyright 2012, Steffen Gebert / TYPO3 Association
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#


Chef::Application.fatal!("You must supply node['site-statustypo3org']['api']['username']") if node['site-statustypo3org']['api']['username'] == nil
Chef::Application.fatal!("You must supply node['site-statustypo3org']['api']['password']") if node['site-statustypo3org']['api']['password'] == nil

include_recipe "php::module_curl"

web_app node['site-statustypo3org']['fqdn'] do
  server_name node['site-statustypo3org']['fqdn']
  server_aliases []
  docroot node['site-statustypo3org']['docroot']
  only_if { node['site-statustypo3org']['fqdn'] != nil }
end

directory node['site-statustypo3org']['docroot'] do
  recursive true
end

git node['site-statustypo3org']['fqdn'] do
  repository node['site-statustypo3org']['repository']
  destination node['site-statustypo3org']['docroot']
end

directory "#{node['site-statustypo3org']['docroot']}/temp" do
  owner node['apache']['user']
end

template "#{node['site-statustypo3org']['docroot']}/config.inc.php" do
  source "config.inc.php.erb"
  mode 0644
end


# TODO###############
# suhosin.executor.include.whitelist = "phar"