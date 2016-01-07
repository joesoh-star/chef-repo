# To install supervisor for job stack servers

execute "intall-supervisor" do
	command "apt-get install -y supervisor"
	action :run
end

execute "start-supervisor" do
	command "service supervisor start"
	action :run
end