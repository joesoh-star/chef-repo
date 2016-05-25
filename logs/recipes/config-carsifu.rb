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
				variables(
					:access_log_file_01 => node['logs']['access_log_file_01'],
					:access_log_stream_01 => node['logs']['access_log_stream_01'],
					:error_log_file_01 => node['logs']['error_log_file_01'],
					:error_log_stream_01 => node['logs']['error_log_stream_01'],
					:access_log_file_02 => node['logs']['access_log_file_02'],
					:access_log_stream_02 => node['logs']['access_log_stream_02'],
					:error_log_file_02 => node['logs']['error_log_file_02'],
					:error_log_stream_02 => node['logs']['error_log_stream_02'],
					:auth_log_file => node['logs']['auth_log_file'],
					:auth_log_stream => node['logs']['auth_log_stream']
				)
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


