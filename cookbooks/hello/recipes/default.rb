#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Updates the package manager repo
apt_update

# Installs nginx
package 'nginx' do
  action :install
end

#Creates a file using a template
template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
end
