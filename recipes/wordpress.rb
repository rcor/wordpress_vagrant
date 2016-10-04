wordpress_location = '/tmp/wordpress.zip'
remote_file wordpress_location do
  source 'https://wordpress.org/latest.zip'
  action :create_if_missing
end
execute 'extract wordpress' do
  command "unzip -v #{wordpress_location} /tmp/"
end
