template "/etc/php5/apache2/php.ini" do
	source "php.ini.erb"
end

execute "create-php-browscap" do
	command "touch /etc/php5/mods-available/php_browscap.ini"
	action :run
end

template "/etc/php5/mods-available/php_browscap.ini" do
	source "php_browscap.ini.erb"
end


execute "add mcrypt symlink" do
  command "ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/apache2/conf.d/20-mcrypt.ini"
  action :run
  not_if { ::File.exists?("/etc/php5/apache2/conf.d/20-mcrypt.ini")}
end


service "apache2" do
	action :restart
end