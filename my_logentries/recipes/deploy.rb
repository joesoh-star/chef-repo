#
# Logentries rsyslog entries
#

node[:deploy].each do |application, deploy|

	template "/etc/rsyslog.d/logentries.conf" do
		source "logentries.conf.erb"
		variables(
		:le_access => node['my_logentries']['le_access'],
		:le_access_token => node['my_logentries']['le_access_token'],
		:le_error => node['my_logentries']['le_error'],
		:le_error_token => node['my_logentries']['le_error_token'],
		:le_auth => node['my_logentries']['le_auth'],
		:le_auth_token => node['my_logentries']['le_auth_token'],
		:le_debug => node['my_logentries']['le_debug'],
		:le_debug_token => node['my_logentries']['le_debug_token']		
		)
		action :create
	end

	execute "restart-rsyslog" do
		command "service rsyslog restart"
		action :run
	end
end