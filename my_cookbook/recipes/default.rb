##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|
  wp-cache = "#{deploy[:deploy_to]}/current/wp-content/cache"
  execute "chmod -R g+rw #{wp-cache}" do
  end
#
  wp-uploads = "#{deploy[:deploy_to]}/current/wp-content/uploads"
  execute "chmod -R g+rw #{wp-uploads}" do
  end

  wp-content-config = "#{deploy[:deploy_to]}/current/wp-content/wp-cache-config.php"
  execute "chmod g+rw #{wp-content-config}" do
  end
end
