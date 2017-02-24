
%w(php libapache2-mod-php php-mcrypt php-mysql).each do |package|
  package 'Install #{package}' do
    package_name package
    action :install
    notifies :restart, 'service[apache2]', :immediately
  end
end


file '/var/index.php' do
  content '<?php phpinfo(); ?>This is a placeholder for the home page.<>'
  mode '0755'
  owner 'web_admin'
  group 'web_admin'
end
