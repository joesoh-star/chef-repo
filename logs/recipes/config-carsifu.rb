#
# Cloudwatch Logs
# 
# by: Kien [20160524]
#

case node[:opsworks][:stack][:name]
	when "carsifu_v3-devops", "carsifu_v3-staging", "carsifu-v3.0"
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
			variables(
					:access_log_file_01 => node['logs']['access_log_file_01'],
					:access_log_stream_01 => node['logs']['access_log_stream_01'],
					:error_log_file_01 => node['logs']['error_log_file_01'],
					:error_log_stream_01 => node['logs']['error_log_stream_01'],
					:access_log_file_02 => node['logs']['access_log_file_02'],
					:access_log_stream_02 => node['logs']['access_log_stream_02'],
					:error_log_file_02 => node['logs']['error_log_file_02'],
					:error_log_stream_02 => node['logs']['error_log_stream_02'],
					:access_log_file_03 => node['logs']['access_log_file_03'],
					:access_log_stream_03 => node['logs']['access_log_stream_03'],
					:error_log_file_03 => node['logs']['error_log_file_03'],
					:error_log_stream_03 => node['logs']['error_log_stream_03'],
					:access_log_file_04 => node['logs']['access_log_file_04'],
					:access_log_stream_04 => node['logs']['access_log_stream_04'],
					:error_log_file_04 => node['logs']['error_log_file_04'],
					:error_log_stream_04 => node['logs']['error_log_stream_04'],
					:access_log_file_05 => node['logs']['access_log_file_05'],
					:access_log_stream_05 => node['logs']['access_log_stream_05'],
					:error_log_file_05 => node['logs']['error_log_file_05'],
					:error_log_stream_05 => node['logs']['error_log_stream_05'],
					:access_log_file_06 => node['logs']['access_log_file_06'],
					:access_log_stream_06 => node['logs']['access_log_stream_06'],
					:error_log_file_06 => node['logs']['error_log_file_06'],
					:error_log_stream_06 => node['logs']['error_log_stream_06'],
					:auth_log_file => node['logs']['auth_log_file'],
					:auth_log_stream => node['logs']['auth_log_stream']
				)
			owner "root"
			group "root"
			mode 0644
		end
	when "carsifu_v3-cms-beta", "PropwallConnect-Develop Stack-Ubuntu", "Propwall-API-Beta"
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3-cms-beta.cfg.erb"
			variables(
					:access_log_file_01 => node['logs']['access_log_file_01'],
					:access_log_stream_01 => node['logs']['access_log_stream_01'],
					:error_log_file_01 => node['logs']['error_log_file_01'],
					:error_log_stream_01 => node['logs']['error_log_stream_01'],
					:access_log_file_02 => node['logs']['access_log_file_02'],
					:access_log_stream_02 => node['logs']['access_log_stream_02'],
					:error_log_file_02 => node['logs']['error_log_file_02'],
					:error_log_stream_02 => node['logs']['error_log_stream_02'],
					:access_log_file_03 => node['logs']['access_log_file_03'],
					:access_log_stream_03 => node['logs']['access_log_stream_03'],
					:error_log_file_03 => node['logs']['error_log_file_03'],
					:error_log_stream_03 => node['logs']['error_log_stream_03'],
					:access_log_file_04 => node['logs']['access_log_file_04'],
					:access_log_stream_04 => node['logs']['access_log_stream_04'],
					:error_log_file_04 => node['logs']['error_log_file_04'],
					:error_log_stream_04 => node['logs']['error_log_stream_04'],
					:auth_log_file => node['logs']['auth_log_file'],
					:auth_log_stream => node['logs']['auth_log_stream']
				)
			owner "root"
			group "root"
			mode 0644
		end
	else
		template "/tmp/cwlogs.cfg" do
			cookbook "logs"
			source "cw-csv3.cfg.erb"
				variables(
					:access_log_file_01 => node['logs']['access_log_file_01'],
					:access_log_stream_01 => node['logs']['access_log_stream_01'],
					:error_log_file_01 => node['logs']['error_log_file_01'],
					:error_log_stream_01 => node['logs']['error_log_stream_01'],
					:auth_log_file => node['logs']['auth_log_file'],
					:auth_log_stream => node['logs']['auth_log_stream']
				)
			owner "root"
			group "root"
			mode 0644
		end
end


