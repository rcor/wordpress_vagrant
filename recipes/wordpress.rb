wordpress_location : '/tmp/wordpress.zip'
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
directory '/var/www/html/wp-content/uploads' do
  mode '0755'
end
template '/var/www/html/wp-content/wp-config.php' do
  source 'wp-config.php.erb'
  mode '0755'
  variables{
      :database : node.default[:wordpress][:database],
      :username : node.default[:mysql][:user],
      :password : node.default[:mysql][:password],
      :table_prefix : node.default[:wordpress][:suffix],
      :secure_auth_key : node.default[:wordpress][:SECURE_AUTH_KEY],
      :logged_in_key : node.default[:wordpress][:LOGGED_IN_KEY],
      :nonce_key : node.default[:wordpress][:NONCE_KEY],
      :auth_salt : node.default[:wordpress][:AUTH_SALT],
      :secure_auth_salt : node.default[:wordpress][:SECURE_AUTH_SALT],
      :logged_in_salt : node.default[:wordpress][:LOGGED_IN_SALT],
      :nonce_salt : node.default[:wordpress][:NONCE_SALT]
  }
end
