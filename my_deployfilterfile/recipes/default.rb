include_recipe 'aws'

aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/blacklist.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/blacklist.txt"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end


aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/spam.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/spam.txt"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end

aws_s3_file "#{deploy[:deploy_to]}/current/wp-content/uploads/filters/spammer.txt" do
  bucket "dsc.propwall.com"
  remote_path "filtering/spammer.txt"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end
