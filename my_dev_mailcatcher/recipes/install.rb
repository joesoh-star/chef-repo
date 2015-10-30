# To install mailcatcher for development environment
# For Development Environment Only

execute "intall-mailcatcher" do
	command "apt-get install -y libsqlite3-dev; gem install mailcatcher"
	action :run
end