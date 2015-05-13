##
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |application, deploy|

  app_root = "/srv/www/classifieds_carsifu/current/carsifu-v2/storage"
  directory app_root do
    owner 'deploy'
    group 'www-data'
    mode '0775' 
    recursive true
  end

execute "chmo-775" do
  command "chmod 775  /srv/www/carsifu/current/automania-v2/wp-content/cache; chmod 775  /srv/www/carsifu/current/automania-v2/wp-content/uploads; chmod 775  /srv/www/carsifu/current/automania-v2/wp-content/w3tc-config; chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework; chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework/cache; chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework/sessions; chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/framework/views; chmod 775  /srv/www/classifieds_carsifu/current/carsifu-v2/storage/logs; chmod a+x  /srv/www/classifieds_carsifu/current/carsifu-v2/vendor/monolog/monolog/src/Monolog/Handler"
  action :run
end

execute "php5enmod mcrypt" do
  command "php5enmod mcrypt; service apache2 restart"
  action :run
end

end
