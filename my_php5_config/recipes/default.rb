template "/etc/php5/apache2/php.ini" do
	source "php.ini.erb"
end

service "apache2" do
	action :restart
end