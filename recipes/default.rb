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