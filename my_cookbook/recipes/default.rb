#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current/cache"
  execute "chmod -R g+rw #{app_root}" do
  end
end


node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current/uploads"
  execute "chmod -R g+rw #{app_root}" do
  end
end
