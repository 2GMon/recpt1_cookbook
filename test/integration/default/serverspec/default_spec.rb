require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

%w!autoconf make gcc g++ pkg-config git wget libpcsclite-dev!.each do |pkg|
  describe package(pkg) do
    it {should be_installed}
  end
end

describe file('/usr/local/lib/libarib25.so') do
  it {should be_file}
  it {should be_owned_by 'root'}
end

describe file('/usr/local/include/arib25/') do
  it { should be_directory }
end

describe file('/etc/udev/rules.d/99-pt1.rules') do
  it {should be_file}
  it {should be_mode 644}
  it {should be_owned_by 'root'}
  it {should be_grouped_into 'root'}
end

describe file('/etc/modprobe.d/pt1-blacklist.conf') do
  it {should be_file}
  it {should be_mode 644}
  it {should be_owned_by 'root'}
  it {should be_grouped_into 'root'}
end

describe file('/etc/udev/rules.d/99-pt3.rules') do
  it {should be_file}
  it {should be_mode 644}
  it {should be_owned_by 'root'}
  it {should be_grouped_into 'root'}
end
