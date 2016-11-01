# Capistrano (v2.8.0 and above) includes a recipe to handle Precompiling Assets in deployment.

#load 'deploy/assets'

set :user, 'polarbea'
set :domain, 'caf.polarbeardesign.net'

set :application, "caf_app"
set :repository,  "git@github.com:polarbeardesign/caf_app.git"
set :scm, 'git'
set :branch, "staging"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache  #In most cases you want to use this option, otherwise each deploy will do a full repository clone every time.
set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/#{user}/#{application}"
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

# to overcome the "stdin: is not a tty\n" error
default_run_options[:pty] = true 

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:

# causes bundle install to run (commented out because no longer allowed to compile gems at Site5)
# require "bundler/capistrano"
# set :bundle_flags, "--quiet --no-cache"

# before "deploy:assets:precompile", "deploy:symlink_db_file"

# after "deploy:restart", "deploy:cleanup", "deploy:symlink_env_file", "deploy:symlink_htaccess_file", "deploy:precompile_other"

namespace :deploy do



end