#
# enable rar for php5
#
# by: Kien [20160523]
#

execute "install rar" do
	command "pecl install rar"
	action :run
end
