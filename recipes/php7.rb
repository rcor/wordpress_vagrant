
%w(php7 libapache2-mod-php7 php7-mcrypt php7-mysql).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
    notifies :restart, 'service[apache2]', :immediately
  end
end
