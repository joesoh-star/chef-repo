##
#Cookbook Name: my_htaccessprotect
#
#Description: To apply basica authentication on htaccess for all non production sites
#

node[:deploy].each do |application, deploy|

	execute "protect dev qa staging environment" do
		command %Q[echo "# BEGIN Basic Access Authentication on protecting dev, qa, beta, staging stacks\n    AuthName '"'Restricted Area'"'\n    AuthType Basic\n    AuthUserFile /etc/apache2/.htpasswd\n    AuthGroupFile /dev/null\n    require valid-user" >> #{deploy[:deploy_to]}/current/.htaccess]
		action :run
	end
end

include_recipe "my_apache2::deploy"