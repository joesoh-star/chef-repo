##
# For CS CMS

node[:deploy].each do |application, deploy|

execute "chmod-775" do
  command "chmod 775  #{deploy[:deploy_to]}/current/wp-content/cache; chmod 775  #{deploy[:deploy_to]}/current/wp-content/uploads; chmod 775  #{deploy[:deploy_to]}/current/wp-content/w3tc-config"
  action :run
end

execute "chmod-640" do
	command "chmod 640 #{deploy[:deploy_to]}/current/.htaccess; chmod 640 #{deploy[:deploy_to]}/current/xmlrpc.php; chmod 640 #{deploy[:deploy_to]}/current/wp-config*"
	action :run
end

execute "add Newrelic Appname" do
  command %Q[echo php_value newrelic.appname "#{deploy[:domains].first}" >> #{deploy[:deploy_to]}/current/.htaccess]
  action :run
end

end
