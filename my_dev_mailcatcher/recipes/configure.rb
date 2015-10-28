# To configure the mailcatcher on php
# To be applied to development environment only

execute "add param to php.ini" do
	command %Q[echo "sendmail_path = /usr/bin/env catchmail -f admin@propwall.com">> etc/php5/apache2/php.ini]
	action :run
end

execute "start mailcatcher" do
	command "mailcatcher --ip 0.0.0.0"
	action :run
end