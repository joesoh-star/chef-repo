#
# Logentries rsyslog entries
#
# By: Kien [20160520]
#

node[:deploy].each do |application, deploy|

	case node[:opsworks][:stack][:name]
		when "carsifu_v3-devops", "carsifu_v3-staging", "carsifu-v3.0"
			template "/etc/rsyslog.d/logentries.conf" do
				source "logentries.conf.devops.erb"
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
		
		when "carsifu_v3-cms-beta"
		
		else
	end	
end