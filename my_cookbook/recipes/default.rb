##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current/wp-content/cache"
  execute "chmod -R g+rw #{app_root}" do
  end
#
  app_root = "#{deploy[:deploy_to]}/current/wp-content/uploads"
  execute "chmod -R g+rw #{app_root}" do
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/wp-cache-config.php"
  file  "#{app_root}" do
	mode '0664'     
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/debug.log"
  file  "#{app_root}" do
	owner 'www-data'
	group 'www-data'
	mode '0664'     
	action :create
  end

end
