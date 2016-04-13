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