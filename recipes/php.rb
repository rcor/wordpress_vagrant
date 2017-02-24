
%w(php libapache2-mod-php php-mcrypt php-mysql).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
    notifies :restart, 'service[apache2]', :immediately
  end
end
