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
