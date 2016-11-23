case node[:platform_family]
when 'debian'
  package 'libapache2-mod-security2' do
    action :install
    retries 3
    retry_delay 5
  end
when 'rhel'
  package 'mod_security' do
    action :install
    retries 3
    retry_delay 5
  end
end
