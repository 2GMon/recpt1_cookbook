#
# Cookbook Name:: recpt1
# Recipe:: default
#
# Copyright 2014, Takaaki TSUJIMOTO
#
# All rights reserved - Do Not Redistribute
#

%w!autoconf make gcc g++ pkg-config git wget libpcsclite-dev!.each do |pkg|
  package pkg do
    action :install
  end
end

package "linux-headers-#{node['kernel']['release']}" do
  action :install
end

bash "install-arib25" do
  not_if "ls /usr/local/lib/libarib25.so"
  user "root"
  code <<-"EOC"
    cd /tmp
    wget http://hg.honeyplanet.jp/pt1/archive/#{node['arib25']['rev']}.tar.bz2
    if [ -e #{node['arib25']['rev']} ]; then
      rm -fr #{node['arib25']['rev']}
    fi
    tar xjvf #{node['arib25']['rev']}.tar.bz2 && cd pt1-#{node['arib25']['rev']}/arib25
    make && make install
  EOC
end

bash "install-pt1_drv" do
  not_if "ls /etc/udev/rules.d/99-pt1.rules"
  user "root"
  code <<-"EOC"
    cd /tmp
    if [ ! -e #{node['recpt1']['rev']}.tar.bz2 ]; then
      wget http://hg.honeyplanet.jp/pt1/archive/#{node['recpt1']['rev']}.tar.bz2
    fi
    if [ -e #{node['recpt1']['rev']} ]; then
      rm -fr #{node['recpt1']['rev']}
    fi
    tar xjvf #{node['recpt1']['rev']}.tar.bz2 && cd pt1-#{node['recpt1']['rev']}/driver
    make && make install
  EOC
end

cookbook_file "/etc/modprobe.d/pt1-blacklist.conf" do
  source "pt1-blacklist.conf"
  owner "root"
  group "root"
  mode 0644
end

git "/tmp/pt3_drv" do
  repository "https://github.com/m-tsudo/pt3"
  action :sync
  user "root"
  group "root"
end

bash "install-pt3_drv" do
  not_if "ls /etc/udev/rules.d/99-pt3.rules"
  user "root"
  code <<-"EOC"
    cd /tmp/pt3_drv
    make && make install
  EOC
end

bash "install-recpt1" do
  not_if "ls /usr/local/bin/recpt1"
  user "root"
  code <<-"EOC"
    cd /tmp
    if [ ! -e #{node['recpt1']['rev']}.tar.bz2 ]; then
      wget http://hg.honeyplanet.jp/pt1/archive/#{node['recpt1']['rev']}.tar.bz2
    fi
    if [ -e #{node['recpt1']['rev']} ]; then
      rm -fr #{node['recpt1']['rev']}
    fi
    tar xjvf #{node['recpt1']['rev']}.tar.bz2 && cd pt1-#{node['recpt1']['rev']}/recpt1
    ./autogen.sh
    ./configure --enable-b25
    make && make install
  EOC
end
