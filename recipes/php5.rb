
%w(php5 libapache2-mod-php).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
    notifies :restart, 'service[apache]', :immediately
  end
end
