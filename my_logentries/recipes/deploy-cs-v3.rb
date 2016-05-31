#
# Logentries rsyslog entries
#
# By: Kien [20160520]
#

node[:deploy].each do |application, deploy|

	case node[:opsworks][:stack][:name]
		when "carsifu_v3-devops", "carsifu_v3-staging", "carsifu-v3.0"
			template "/etc/rsyslog.d/logentries.conf" do
				source "logentries.conf.csv3.devops.erb"
					variables(
						:le_access_01 => node['logs']['access_log_file_01'],
						:le_access_token_01 => node['my_logentries']['le_access_token_01'],
						:le_error_01 => node['logs']['error_log_file_01'],
						:le_error_token_01 => node['my_logentries']['le_error_token_01'],
						:le_access_02 => node['logs']['access_log_file_02'],
						:le_access_token_02 => node['my_logentries']['le_access_token_02'],
						:le_error_02 => node['logs']['error_log_file_02'],
						:le_error_token_02 => node['my_logentries']['le_error_token_02'],
						:le_auth => node['logs']['auth_log_file'],
						:le_auth_token => node['my_logentries']['le_auth_token']		
					)
				action :create
			end
		when "carsifu_v3-beta"
			template "/etc/rsyslog.d/logentries.conf" do
				source "logentries.conf.csv3.beta.erb"
					variables(
						:le_access_01 => node['logs']['access_log_file_01'],
						:le_access_token_01 => node['my_logentries']['le_access_token_01'],
						:le_error_01 => node['logs']['error_log_file_01'],
						:le_error_token_01 => node['my_logentries']['le_error_token_01'],
						:le_access_02 => node['logs']['access_log_file_02'],
						:le_access_token_02 => node['my_logentries']['le_access_token_02'],
						:le_error_02 => node['logs']['error_log_file_02'],
						:le_error_token_02 => node['my_logentries']['le_error_token_02'],
						:le_access_03 => node['logs']['access_log_file_03'],
						:le_access_token_03 => node['my_logentries']['le_access_token_03'],
						:le_error_03 => node['logs']['error_log_file_03'],
						:le_error_token_03 => node['my_logentries']['le_error_token_03'],
						:le_access_04 => node['logs']['access_log_file_04'],
						:le_access_token_04 => node['my_logentries']['le_access_token_04'],
						:le_error_04 => node['logs']['error_log_file_04'],
						:le_error_token_04 => node['my_logentries']['le_error_token_04'],
						:le_access_05 => node['logs']['access_log_file_05'],
						:le_access_token_05 => node['my_logentries']['le_access_token_05'],
						:le_error_05 => node['logs']['error_log_file_05'],
						:le_error_token_05 => node['my_logentries']['le_error_token_05'],
						:le_access_06 => node['logs']['access_log_file_06'],
						:le_access_token_06 => node['my_logentries']['le_access_token_06'],
						:le_error_06 => node['logs']['error_log_file_06'],
						:le_error_token_06 => node['my_logentries']['le_error_token_06'],
						:le_auth => node['logs']['auth_log_file'],
						:le_auth_token => node['my_logentries']['le_auth_token']
					)
				action :create
			end
		when "carsifu_v3-cms-beta"
			template "/etc/rsyslog.d/logentries.conf" do
				source "logentries.conf.csv3.cms-beta.erb"
					variables(
						:le_access_01 => node['logs']['access_log_file_01'],
						:le_access_token_01 => node['my_logentries']['le_access_token_01'],
						:le_error_01 => node['logs']['error_log_file_01'],
						:le_error_token_01 => node['my_logentries']['le_error_token_01'],
						:le_access_02 => node['logs']['access_log_file_02'],
						:le_access_token_02 => node['my_logentries']['le_access_token_02'],
						:le_error_02 => node['logs']['error_log_file_02'],
						:le_error_token_02 => node['my_logentries']['le_error_token_02'],
						:le_access_03 => node['logs']['access_log_file_03'],
						:le_access_token_03 => node['my_logentries']['le_access_token_03'],
						:le_error_03 => node['logs']['error_log_file_03'],
						:le_error_token_03 => node['my_logentries']['le_error_token_03'],
						:le_access_04 => node['logs']['access_log_file_04'],
						:le_access_token_04 => node['my_logentries']['le_access_token_04'],
						:le_error_04 => node['logs']['error_log_file_04'],
						:le_error_token_04 => node['my_logentries']['le_error_token_04'],
						:le_auth => node['logs']['auth_log_file'],
						:le_auth_token => node['my_logentries']['le_auth_token']
					)
				action :create
			end		
		else
			template "/etc/rsyslog.d/logentries.conf" do
				source "logentries.conf.csv3.default.erb"
					variables(
						:le_access_01 => node['logs']['access_log_file_01'],
						:le_access_token_01 => node['my_logentries']['le_access_token_01'],
						:le_error_01 => node['logs']['error_log_file_01'],
						:le_error_token_01 => node['my_logentries']['le_error_token_01'],
						:le_auth => node['logs']['auth_log_file'],
						:le_auth_token => node['my_logentries']['le_auth_token']		
					)
			action :create
			end	
end