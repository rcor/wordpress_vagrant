
%w(php5 libapache2-mod-php5 php5-mcrypt php5-mysql).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
    notifies :restart, 'service[apache2]', :immediately
  end
end
