#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update

# group 'nginx' do
#   action :create
# end
#
# user 'nginx' do
#   group 'nginx'
#   action :create
# end

package 'nginx' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
end
