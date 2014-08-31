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

package "linux-headers-#{node['arib25']['kernel_version']}" do
  action :install
end

bash "install-arib25" do
  not_if "ls /usr/local/lib/libarib25.so"
  user "root"
  code <<-"EOC"
    cd /tmp
    wget http://hg.honeyplanet.jp/pt1/archive/#{node['arib25']['rev']}.tar.bz2
    if [ -e #{node['arib25']['rev']} ]; then
      rm #{node['arib25']['rev']}
    fi
    tar xjvf #{node['arib25']['rev']}.tar.bz2 && cd pt1-#{node['arib25']['rev']}/arib25
    make && make install
  EOC
end
