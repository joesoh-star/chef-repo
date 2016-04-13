#
# Logentries rsyslog entries
#

template "/etc/rsyslog.d/logentries.conf" do
	source "logentries.conf.erb"
	variables(
	:lelogfile => node['my_logentries']['lelogfile'],
	:letoken => node['my_logentries']['letoken']
	)
	action :create
end

execute "restart-rsyslog" do
	command "service rsyslog restart"
	action :run
end