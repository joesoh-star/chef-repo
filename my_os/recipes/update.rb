#
# Update OS Patches
#

execute "update os" do
  command "apt-get update && apt-get -y dist-upgrade"
  action :run
end