#
# Clean Syslog
#

if platform_family?('debian')
	execute "clean-syslog" do
		command "cat /dev/null > /var/log/syslog"
	action :run
	end
end

if platform_family?('rhel')
	execute "clean-syslog" do
		command "cat /dev/null > /var/log/message"
	action :run
	end
end
