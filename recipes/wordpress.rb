wordpress_location = '/tmp/wordpress.zip'
remote_file wordpress_location do
  source 'https://wordpress.org/latest.zip'
  action :create_if_missing
end
execute 'extract wordpress' do
  command "unzip #{wordpress_location} -d /tmp/"
end
execute 'move files' do
  command 'cp -rfv /tmp/wordpress/* /var/www/html/'
end
execute 'rm files' do
  command 'rm -rfv /tmp/wordpress/'
end
