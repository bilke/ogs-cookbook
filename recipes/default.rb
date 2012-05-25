#
# Cookbook Name:: ogs
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "qt4-dev-tools" do
	action :install
end

package "libvtk5-dev" do
	action :install
end

package "libvtk5-qt4-dev" do
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