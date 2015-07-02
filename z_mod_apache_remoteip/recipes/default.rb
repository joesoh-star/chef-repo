#
# Cookbook Name:: z_mod_apache_remoteip
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

execute "a2enmod remoteip" do
  command "a2enmod remoteip"
  action :run
end

file "/etc/apache2/mods-available/remoteip.conf" do
  content "RemoteIPHeader X-Forwarded-For"
  mode "0644"
  owner "root"
  group "root"
end

link "/etc/apache2/mods-enabled/remoteip.conf" do
  to "/etc/apache2/mods-available/remoteip.conf"
end

execute "Restart Apache" do
  command "service apache2 restart"
  action :run
end

end
