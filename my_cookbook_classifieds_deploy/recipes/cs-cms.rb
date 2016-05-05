##
# For CS CMS

node[:deploy].each do |application, deploy|

execute "chmod-775" do
  command "chmod 775  #{deploy[:deploy_to]}/current/wp-content/cache; chmod 775  #{deploy[:deploy_to]}/current/wp-content/uploads; chmod 775  #{deploy[:deploy_to]}/current/wp-content/w3tc-config"
  action :run
end

execute "chmod-664" do
	command "chmod 664 #{deploy[:deploy_to]}/.htaccess"
	action :run
end

end
