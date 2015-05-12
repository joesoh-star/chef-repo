##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

  app_root = "/srv/www/classifieds_carsifu/current/carsifu-v2/storage"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
  end

execute "chmo-775" do
  command "chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/logs"
  command "chmod a+x  /srv/www/classifieds_carsifu/releases/20150512063711/carsifu-v2/vendor/monolog/monolog/src/Monolog/Handler"
  action :run
end

  app_root = "/srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
    action :create 
  end

  app_root = "/srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework/views"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
    action :create 
  end
  
  app_root = "/srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework/sessions"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
    action :create 
  end
  app_root = "/srv/www/carsifu/current/automania-v2/wp-content/uploads"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    action :create 
  end

end
