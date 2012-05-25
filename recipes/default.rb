#
# Cookbook Name:: ogs
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### Install packages ###

package "qt4-dev-tools" do
	action :install
end

package "libvtk5-dev" do
	action :install
end

package "libvtk5-qt4-dev" do
	action :install
end

package "cmake" do
	action :install
end

package "cmake-curses-gui" do
	action :install
end

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

directory "/home/vagrant/ogs" do
  owner "vagrant"
  mode "0755"
  action :create
end

git "/home/vagrant/ogs/sources" do
  repository "git://vismac02.intranet.ufz.de/+ff-devs/ogs5/ff-sources.git"
  reference "master"
  user "vagrant"
  action :sync
end

directory "/home/vagrant/ogs6" do
  owner "vagrant"
  mode "0755"
  action :create
end

git "/home/vagrant/ogs6/sources" do
  repository "git://github.com/ufz/ogs.git"
  reference "master"
  user "vagrant"
  action :sync
end