#
# Update OS Patches
#

if platform_family?('debian')
	execute "update os" do
		command "apt-get update && apt-get -y dist-upgrade"
	action :run
	end
end

if platform_family?('rhel')
	execute "update os" do
		command "yum -y update"
	action :run
	end
end