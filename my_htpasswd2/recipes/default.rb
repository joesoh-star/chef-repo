# add htpasswd user.
include_recipe "htpasswd::default"

htpasswd "/etc/apache2/.htpasswd" do
  user node[:apache][:htpasswd_user] 
  password node[:apache][:htpasswd_passwd] 
  type "sha1"
  action :overwrite
end