# To install mailcatcher for development environment
# For Development Environment Only

execute "intall-mailcatcher" do
	command "apt-get install libsqlite3-dev; gem install mailcatcher"
	action :run
end

execute "add param to php.ini" do
	command %Q[echo "sendmail_path = /usr/bin/env catchmail -f admin@propwall.com">> etc/php5/apache2/php.ini]
	action :run
end