#Install Additional Required Apache2 PHP Modules
pkg = value_for_platform_family(
    [ 'rhel', 'fedora' ] => 'php-intl',
    'debian' => 'php5-intl'
)

package pkg do
  action :install
  notifies(:run, "execute[/usr/sbin/php5enmod intl]", :immediately) if platform?('ubuntu') && node['platform_version'].to_f >= 14.04
end

execute '/usr/sbin/php5enmod intl' do
  action :nothing
  only_if { platform?('ubuntu') && node['platform_version'].to_f >= 14.04 && ::File.exists?('/usr/sbin/php5enmod') }
end

# add htpasswd user.
include_recipe "htpasswd::default"

htpasswd "/etc/apache2/.htpassword" do
  user node[:apache][:htpasswd_user] 
  password node[:apache][:htpasswd_passwd] 
  type "sha1"
  action :overwrite
end