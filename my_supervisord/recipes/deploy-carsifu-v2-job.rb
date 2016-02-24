#To create and insert supervisor config file
#For laravel job server only

node[:deploy].each do |application, deploy|
	execute "create-conf" do
		command %Q[touch /etc/supervisor/conf.d/#{deploy[:domains].first}.conf]
		action :run
	end

	execute "insert-conf" do
		command %Q[echo "[program:#{deploy[:domains].first}]\ncommand=php #{deploy[:deploy_to]}/current/carsifu-v2/artisan queue:work --sleep=3 --tries=3 --daemon\nautostart=true\nautorestart=true\nstderr_logfile=/var/log/supervisor/#{deploy[:domains].first}.err.log\nstdout_logfile=/var/log/supervisor/#{deploy[:domains].first}.out.log\nuser=www-data\n" > /etc/supervisor/conf.d/#{deploy[:domains].first}.conf]
		action :run
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