package 'Install Mysql' do
  package_name 'mysql-server'
  action :install
end
execute "create user #{user}"
  command "CREATE USER IF NOT EXISTS '#{user}'@'localhost' IDENTIFIED BY '#{password}';"
end

execute "create database #{database}"
  command "CREATE USER IF NOT EXISTS '#{user}'@'localhost' IDENTIFIED BY '#{password}';"
end

execute "assing database  #{database} to user #{user}"
  command "CREATE USER IF NOT EXISTS '#{user}'@'localhost' IDENTIFIED BY '#{password}';"
end
