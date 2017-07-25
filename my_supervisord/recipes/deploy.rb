#To create and insert supervisor config file
#For laravel job server only

node[:deploy].each do |application, deploy|
	
	app_name = "#{deploy[:domains].first}"

	template "/etc/supervisor/conf.d/#{app_name}.conf" do
		source "supervisor-app.conf.erb"
			variables(
				:commandpath => node['my_supervisord']['commandpath'],
				:numprocs => node['my_supervisord']['numprocs'],
				:appname => "#{app_name}",
				:apppath => "#{deploy[:deploy_to]}"
			)
	end

	execute "supervisor-reread-config" do
		command "supervisorctl reread"
		action :run
	end

	execute "supervisor-update-config" do
		command "supervisorctl update"
		action :run
	end

	execute "restart-daemon" do
		command %Q[php #{deploy[:deploy_to]}/current/artisan queue:restart]
		action :run
	end
end
