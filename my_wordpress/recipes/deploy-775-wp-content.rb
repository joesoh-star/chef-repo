# To chmod 775 on wp-content
# For WordPress Only
# For use with Deploy
# KO

node[:deploy].each do |application, deploy|

execute "chown" do
  command "chmod -R 775 #{deploy[:deploy_to]}/current/wp-content"
  action:run
end

end