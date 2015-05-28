##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

#execute "php5enmod mcrypt" do
#  command "php5enmod mcrypt; composer update; service apache2 restart"
#  action :run
#end

# add htpasswd user.
include_recipe "htpasswd::default"

htpasswd "/etc/apache2/.htpassword" do
  user node[:apache][:htpasswd_user] 
  password node[:apache][:htpasswd_passwd] 
  type "sha1"
  action :overwrite
end

end
