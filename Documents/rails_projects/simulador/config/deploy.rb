set :application, "set your application name here"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `non

set :application, "simulador"

set :scm, :git

set :deploy_yo, "/var/www/#{application}"

role :app, "localhost"
role :db, "simuladorcredito.cdua66i9fogs.us-west-2.rds.amazonaws.com", :primary => true
role :utility, "ec2-54-69-82-229.us-west-2.compute.amazonaws.com"

set :rails_env, :production

set :user, "project_user"
set :use_sudo, false

set :rvm_ruby_string, '1.9.3'

set :rvm_type, :system

after "deploy:setup", "deploy:set_rvm_version"

 

namespace :deploy do

 

  task :set_rvm_version, :roles => :app, :except => { :no_release => true } do

    run "source /etc/profile.d/rvm.sh && rvm use #{rvm_ruby_string} --default"

  end

 

  task :start, :roles => :app, :except => { :no_release => true } do

    run "/etc/init.d/unicorn start"

  end

 

  task :stop, :roles => :app, :except => { :no_release => true } do

    run "/etc/init.d/unicorn stop"

  end

 

  task :restart, :roles => :app, :except => { :no_release => true } do

    run "/etc/init.d/unicorn restart"

  end

 

  # Precompile assets

  namespace :assets do

    task :precompile, :roles => :web, :except => { :no_release => true } do

      run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}

    end

  end

 

end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
