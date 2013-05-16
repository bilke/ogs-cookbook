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
             "libnetcdf-dev",
             "libshp-dev",
             "libgeotiff-dev",
             "libboost1.48-all-dev"]

packages.push("qt4-dev-tools",
              "libvtk5-dev",
              "libvtk5-qt4-dev") if node.ogs['gui']

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

### OGS-5 from SVN
if not node.ogs["svn_user"].empty? and not node.ogs["svn_password"].empty?
  directory "/home/vagrant/ogs5" do
    owner "vagrant"
    mode "0755"
    action :create
  end

  subversion "/home/vagrant/ogs5/sources" do
    repository "https://svn.ufz.de/svn/ogs/trunk/sources"
    revision "HEAD"
    user "vagrant"
    action :sync
    svn_username node.ogs['svn_user']
    svn_password node.ogs['svn_password']
  end

  if not node.ogs["branch"].empty?
    subversion "/home/vagrant/ogs5/branch" do
      repository "https://svn.ufz.de/svn/ogs/branches/#{node.ogs['branch']}"
      revision "HEAD"
      user "vagrant"
      action :sync
      svn_username node.ogs['svn_user']
      svn_password node.ogs['svn_password']
    end
  end

  if node.ogs["benchmarks"]
    subversion "/home/vagrant/ogs5/benchmarks" do
      repository "https://svn.ufz.de/svn/ogs/trunk/benchmarks"
      revision "HEAD"
      user "vagrant"
      action :sync
      svn_username node.ogs['svn_user']
      svn_password node.ogs['svn_password']
    end
  end
  
  if node.ogs["benchmarks_ref"]
    subversion "/home/vagrant/ogs5/benchmarks_ref" do
      repository "https://svn.ufz.de/svn/ogs/trunk/benchmarks_ref"
      revision "HEAD"
      user "vagrant"
      action :sync
      svn_username node.ogs['svn_user']
      svn_password node.ogs['svn_password']
    end
  end

end
