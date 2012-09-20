#
# Cookbook Name:: ogs
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Install packages ###
packages = [ "vim",
             "cmake",
             "cmake-curses-gui",
             "qt4-dev-tools",
             "libvtk5-dev",
             "libvtk5-qt4-dev",
             "libnetcdf-dev",
             "libshp-dev",
             "libgeotiff-dev"]

packages.each { |current_package|
	package current_package do
		action :install
	end
}


### SSH configs ###
cookbook_file "/home/vagrant/.ssh/config" do
	source "ssh_config"
	mode "0644"
	owner "vagrant"
end

cookbook_file "/home/vagrant/.ssh/known_hosts" do
	source "ssh_known_hosts"
	mode "0600"
	owner "vagrant"
end

### Clone source code ###
directory "/home/vagrant/ogs6" do
  owner "vagrant"
  mode "0755"
  action :create
end

git "/home/vagrant/ogs6/sources" do
  repository "git://github.com/ufz/ogs.git"
  revision "HEAD"
  user "vagrant"
  action :sync
end