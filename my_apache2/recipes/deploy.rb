# Move back apache2 default site to 000-default.conf
node[:deploy].each do |application, deploy|

# Create an empty page for elb to ping
# For Dev, Staging, Beta, and QA APPs only
	execute 'create default empty page for elb-heartbeat' do
		command "touch /var/www/elb-beat.html"
		action :run
	end

# move back default virtual host so that the new app becomes the default virtual host
	if platform?('ubuntu') && node[:platform_version] == '14.04'
		source_default_site_config = "#{node[:apache][:dir]}/sites-enabled/zzz-default.conf"
		target_default_site_config = "#{node[:apache][:dir]}/sites-enabled/000-default.conf"
	else
		source_default_site_config = "#{node[:apache][:dir]}/sites-enabled/zzz-default"
		target_default_site_config = "#{node[:apache][:dir]}/sites-enabled/000-default"
	end	
	execute 'mv back default virtual host' do
		action :run
		command "mv #{source_default_site_config} #{target_default_site_config}"
		notifies :reload, "service[apache2]", :delayed
		only_if do
		::File.exists?(source_default_site_config)
		end
	end
end