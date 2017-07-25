#To create and insert supervisor config file
#For laravel job server only

node[:deploy].each do |application, deploy|
#	execute "create-conf" do
#		command %Q[touch /etc/supervisor/conf.d/#{deploy[:domains].first}.conf]
#		action :run
#	end

#	execute "insert-conf" do
#		command %Q[echo "[program:#{deploy[:domains].first}]\ncommand=php #{deploy[:deploy_to]}/current/artisan queue:work --sleep=3 --tries=3 --daemon\nautostart=true\nautorestart=true\nnumprocs=5\nprocess_name=%(program_name)s_%(process_num)02d\nstderr_logfile=/var/log/supervisor/#{deploy[:domains].first}.err.log\nstdout_logfile=/var/log/supervisor/#{deploy[:domains].first}.out.log\nuser=www-data\n" > /etc/supervisor/conf.d/#{deploy[:domains].first}.conf]
#		action :run
#	end
	app_name = "#{deploy[:domains].first}"

	template "/etc/supervisor/conf.d/#{app_name}.conf]" do
		source "supervisor-app.conf.erb"
		variables (
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
