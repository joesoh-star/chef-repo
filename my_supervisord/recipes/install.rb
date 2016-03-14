# To install supervisor for job stack servers

execute "intall-supervisor" do
	command "apt-get install -y supervisor"
	action :run
end

execute "intall-sendmail" do
	command "apt-get install -y sendmail"
	action :run
end

execute "intall-python-pip" do
	command "apt-get install -y python-pip"
	action :run
end

execute "intall-superlance" do
	command "pip install superlance"
	action :run
end

template "/etc/supervisor/supervisord.conf" do
	source "supervisord.conf.erb"
	variables(
	email_address => node[:supervisord][:email_address]
	)
	action :overwrite
end
