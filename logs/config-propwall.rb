#config.rb

template "/tmp/cwlogs.cfg" do
  cookbook "cloudwatch_logs"
  source "propwall.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end
