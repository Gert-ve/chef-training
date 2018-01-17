#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update

group 'nginx' do
  action :create
end

user 'nginx' do
  group 'nginx'
  action :create
end

directory '/var/www/' do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
end

package 'nginx' do
  action :install
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
end

file '/var/www/index.html' do
  content '<html>Hello World!!</html>'
  mode '0755'
  owner 'nginx'
  group 'nginx'
end

template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :restart, 'service[nginx]', :immediately
end
