##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

  app_root = "#{deploy[:deploy_to]}/current/storage"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
  end

execute "chmo-775" do
  command "chmod -R 775  #{deploy[:deploy_to]}/current/storage/framework; chmod 775  #{deploy[:deploy_to]}/current/storage/logs"
  action :run
end


# install composer.
include_recipe "composer::default"

directory "/root/.composer" do
  mode '775'
  action :create
end

template "/root/.composer/auth.json" do
  source "composer_auth_json.erb"
end

#install project vendors
composer_project "#{deploy[:deploy_to]}/current" do
#    dev "node[:composer][:dev]"
    dev true
    quiet true
    prefer_dist false
    action :install
end

end
