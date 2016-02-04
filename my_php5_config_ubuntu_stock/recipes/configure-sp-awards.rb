##Set upload_max_filesize to 8m in php.ini
##For SP-Awards

template "/etc/php5/apache2/php.ini" do
	source "php.ini.8m.erb"
end

service "apache2" do
	action :restart
end