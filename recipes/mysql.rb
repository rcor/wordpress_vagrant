
package 'Install Mysql' do
  package_name 'mysql-server'
  action :install
end
execute "create database #{node.default[:mysql][:database]}" do
  command
  "mysql --user #{node.default[:mysql][:user]} < "\
  " CREATE IF NOT EXISTS DATABASE #{node.default[:wordpress][:database]}"
end
