# Capistrano (v2.8.0 and above) includes a recipe to handle Precompiling Assets in deployment.

load 'deploy/assets'

#set :user, 'polarbea'
#set :user, 'deploy'
#set :domain, 'caf.polarbeardesign.net'

server '172.31.13.42', user: 'deploy', roles: %w{web app db}
set :application, "caf_app"
#set :repository,  "git@github.com:polarbeardesign/caf_app.git"
set :repo_url,  "git@github.com:polarbeardesign/caf_app.git"
set :scm, 'git'
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache  #In most cases you want to use this option, otherwise each deploy will do a full repository clone every time.
set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/#{user}/#{application}"
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

# to overcome the "stdin: is not a tty\n" error
default_run_options[:pty] = true 

# settings for e2c
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.1.6' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false



#role :web, domain                          # Your HTTP server, Apache/etc
#role :app, domain                          # This may be the same as your `Web` server
#role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:

# causes bundle install to run (commented out because no longer allowed to compile gems at Site5)
# require "bundler/capistrano"
# set :bundle_flags, "--quiet --no-cache"

before "deploy:assets:precompile", "deploy:symlink_db_file"

after "deploy:restart", "deploy:cleanup", "deploy:symlink_env_file", "deploy:symlink_htaccess_file", "deploy:symlink_uploads", "deploy:precompile_other"

namespace :deploy do

   task :start do ; end
   task :stop do ; end


   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

  desc "symlink my db file"
  task :symlink_db_file do
    run "ln -s /home/#{user}/#{application}/shared/database.yml #{latest_release}/config/database.yml"
  end

  desc "symlink my db file again"
  task :symlink_db_file_II do
    run "ln -s /home/#{user}/#{application}/shared/database.yml /home/#{user}/#{application}/current/config/database.yml"
  end

  desc "symlink my env file"
  task :symlink_env_file do
    run "ln -s /home/#{user}/#{application}/shared/production.rb /home/#{user}/#{application}/current/config/environments/production.rb"
  end

   desc "symlink the public uploads folder"
   task :symlink_uploads do
     run "ln -nfs #{shared_path}/uploads  #{release_path}/public/uploads"
   end

  desc "symlink my htaccess file"
  task :symlink_htaccess_file do
    run "ln -s /home/#{user}/#{application}/shared/.htaccess /home/#{user}/#{application}/current/public/.htaccess"
  end

  desc "precompile other"
  task :precompile_other do
    run "cd /home/#{user}/#{application}/current && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile"
  end

end