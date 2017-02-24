package 'Install Apache' do
  package_name 'apache2'
end



service 'apache2' do
  action :nothing
end
