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

directory "#{deploy[:deploy_to]}/current/vendor" do
  owner 'deploy'
  group 'www-data'
  mode '0775'
  action :create
end

execute "chmo-775" do
  command "chmod -R 775  #{deploy[:deploy_to]}/current/storage/framework; chmod 775  #{deploy[:deploy_to]}/current/storage/logs"
  action :run
end

#Add php5-mcrypt to cli/conf.d
execute "add mcrypt symlink" do
  command "ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/cli/conf.d/20-mcrypt.ini"
  action :run
  not_if { ::File.exists?("/etc/php5/cli/conf.d/20-mcrypt.ini")}
end

#Add copy App variable to .env file
template "#{deploy[:deploy_to]}/current/.env" do
  source "laravel_env.erb"
  mode 0440
  owner deploy[:user]
  group deploy[:group]
  variables(
    :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables])
  )
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
    action :update
end

execute "php artisan" do
  command "php #{deploy[:deploy_to]}/current artisan migrate"
  only_if do
    if node[:opsworks][:layers]['Layer PHP App Server'] && node[:opsworks][:layers]['Layer PHP App Server'][:instances].empty?
       # no 'online' php servers --> we are the first one booting
       true
    elsif node[:opsworks][:instance][:hostname] == node[:opsworks][:layers]['Layer PHP App Server'][:instances].keys.sort.first
       # we are the first 'online' php-app server
       true
    else
      # we are not the first one
      false
    end
  end

end

end
