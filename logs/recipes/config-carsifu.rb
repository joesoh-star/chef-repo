#
# Cloudwatch Logs
# 
# by: Kien [20160524]
#

case node[:opsworks][:stack][:name]
	when "carsifu_v3-devops"
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3-devops.cfg.erb"
			owner "root"
			group "root"
			mode 0644
		end
	when "carsifu_v3-beta"
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3-beta.cfg.erb"
			owner "root"
			group "root"
			mode 0644
		end
	when "carsifu_v3-cms-beta"
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3-cms-beta.cfg.erb"
			owner "root"
			group "root"
			mode 0644
		end
	when "carsifu_v3-staging"
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3-staging.cfg.erb"
			owner "root"
			group "root"
			mode 0644
		end	
end


