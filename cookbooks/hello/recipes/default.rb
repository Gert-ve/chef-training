#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update

package 'nginx' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
end
