# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'pink1'
set :repo_url, 'git@github.com:spieker/pink1.git'
set :user, 'root'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/root/api/'

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :puma_init_active_record, true
set :nginx_server_name, '_'

namespace :deploy do

  task :restart do
    on role(:app) do
      foreman.export

      # on OS X the equivalent pid-finding command is `ps | grep '/puma' | head -n 1 | awk {'print $1'}`
      run "(kill -s SIGUSR1 $(ps -C ruby -F | grep '/puma' | awk {'print $2'})) || #{sudo} service #{app_name} restart"

      # foreman.restart # uncomment this (and comment line above) if we need to read changes to the procfile
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :puma do

  desc 'Setup Puma config file'
  task :config do
    on roles(fetch(:puma_role)) do |role|
      template_puma 'puma.rb', fetch(:puma_conf), role
    end
  end

end

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles(:app) do
      run "cd #{current_path} && foreman export upstart /etc/init -a #{application} -u #{user} -l /var/#{application}/log"
    end
  end

  desc "Start the application services"
  task :start do
    on roles(:app) do
      run "service #{app_name} start"
    end
  end

  desc "Stop the application services"
  task :stop do
    on roles(:app) do
      run "service #{app_name} stop"
    end
  end

  desc "Restart the application services"
  task :restart do
    on roles(:app) do
      run "service #{app_name} start || #{sudo} service #{app_name} restart"
    end
  end
end
