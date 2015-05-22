include_recipe 'aws'
aws = data_bag_item("aws", "main")

node[:deploy].each do |application, deploy|

directory "#{deploy[:deploy_to]}/current/wp-content/uploads/filters" do
owner 'deploy'
group 'www-data'
mode '0770'
action :create
end

aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/blacklist.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/blacklist.txt"
  aws_access_key_id node['my_deployfilterfile'][:custom_access_key]
  aws_secret_access_key node['my_deployfilterfile'][:custom_secret_key]
  owner 'deploy'
  group 'www-data'
  mode '0770'
end


aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/spam.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/spam.txt"
  aws_access_key_id node['my_deployfilterfile'][:custom_access_key]
  aws_secret_access_key node['my_deployfilterfile'][:custom_secret_key]
  owner 'deploy'
  group 'www-data'
  mode '0770'
end

aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/spammer.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/spammer.txt"
  aws_access_key_id node['my_deployfilterfile'][:custom_access_key]
  aws_secret_access_key node['my_deployfilterfile'][:custom_secret_key]
  owner 'deploy'
  group 'www-data'
  mode '0770'
end

end


