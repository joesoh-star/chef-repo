#
# Cookbook Name:: my_htpasswd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "htpasswd::default"

directory "/etc/htpasswd/" do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end

htpasswd "/etc/htpasswd/.htpasswd" do
 user "foo"
 password "bar"
 type "sha1"
 action :overwrite
end
