template "/etc/apache2/mods-enabled/mpm_prefork.conf" do
	source "mpm_prefork.conf.erb"
end

service "apache2" do
	action :restart
end