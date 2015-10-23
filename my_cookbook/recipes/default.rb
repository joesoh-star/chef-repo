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

  app_root = "#{deploy[:deploy_to]}/current/wp-content/uploads"
  execute "chmod -R g+rw #{app_root}" do
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/plugins/bwp-minify"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    action :create 
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/plugins/bwp-minify/cache"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    action :create 
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/plugins/bwp-minify/min"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    action :create 
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/debug.log"
  file  "#{app_root}" do
	owner 'deploy'
	group 'www-data'
	mode '0664'     
	action :create
  end

  app_root = "#{deploy[:deploy_to]}/current/wp-content/plugins/bwp-minify/min/config.php"
  file  "#{app_root}" do
	owner 'deploy'
	group 'www-data'
	mode '0664'     
	action :create
  end
#
#Enable cache for beta and production ENV
#
# "#{deploy[:deploy_to]}/current/wp-content/wp-cache-config.php" 
#  env "devops" do
    cookbook_file "wp-cache-config.php" do
      owner "www-data"
      group "www-data"
      mode "0664"
      path  "#{deploy[:deploy_to]}/current/wp-content/wp-cache-config.php"
    end

#install Composer project vendors
composer_project "#{deploy[:deploy_to]}/current" do
    dev false
    quiet true
    prefer_dist true
    action :install
end


#Description: To enable url rewrite from *.propwall.com to the proper propwall.my stacks
template "#{deploy[:deploy_to]}/current/.htaccess" do
	source "htaccess.erb"
	variables :url_name => params["#{deploy[:domains].first}"]
end

end
