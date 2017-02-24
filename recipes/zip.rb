
%w(zip gzip tar).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
  end
end
