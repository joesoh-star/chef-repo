define :laravel_env, :template => 'laravel_env.erb' do

  application_name = params[:name]

  environment_variables = if node[:deploy][application_name].nil?
                            {}
                          else
                            node[:deploy][application_name][:environment_variables]
                          end
end
