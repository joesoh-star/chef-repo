##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

execute "a2enmod proxy_http remoteip, php5enmod mcrypt" do
  command "a2enmod proxy_http; a2enmod remoteip; php5enmod mcrypt"
  action :run
end

link "/etc/php5/apache2/conf.d/20-mcrypt.ini" do
  to "/etc/php5/mods-available/mcrypt.ini"
end

link "/etc/php5/cli/conf.d/20-mcrypt.ini" do
  to "/etc/php5/mods-available/mcrypt.ini"
end

file '/etc/php5/mods-available/remoteip.conf' do
  content 'RemoteIPHeader X-Forwarded-For'
  mode '0644'
  owner 'root'
  group 'root'
end 

link "/etc/apache2/mods-enabled/remoteip.conf" do
  to "/etc/php5/mods-available/remoteip.conf"
end

execute "Restart Apache" do
  command "service apache2 restart"
  action :run
end

# add htpasswd user.
include_recipe "htpasswd::default"

htpasswd "/etc/apache2/.htpasswd" do
  user node[:apache][:htpasswd_user] 
  password node[:apache][:htpasswd_passwd] 
  type "sha1"
  action :overwrite
end

end
