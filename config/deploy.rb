require 'rake'
require 'capistrano-rbenv'

set :stages, %w(production staging)
set :default_stage, "staging"

set :db_adapter,     'postgres'
set :mount_point,    '/'
set :application,    'facsite'
set :user,           'facsite'
set :rails_env,      'production'
set :deploy_to,      "/rest/u/#{user}/apps/#{application}"
#set :bundle_without, %w[development test]
set :asset_env,      "RAILS_GROUPS=assets RAILS_RELATIVE_URL_ROOT=#{mount_point.sub(/\/+\Z/, '')}"

set :rbenv_path, '/usr/local/rbenv'
set :rbenv_ruby_version, "2.0.0-p247"

set :scm, :git
set :repository, "git://github.com/zzet/facsite.git"

set :use_sudo, false
set :ssh_options, :forward_agent => true
default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{release_path}/config/database.yml.sample #{release_path}/config/database.yml"
  end

  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end

  desc "Symlinks the puma.rb"
  task :symlink_puma, :roles => :app do
    run "ln -nfs #{release_path}/config/puma.rb.sample #{release_path}/config/puma.rb"
  end

  desc <<-DESC
    Send a USR2 to the unicorn process to restart for zero downtime deploys.
      runit expects 2 to tell it to send the USR2 signal to the process.
  DESC
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo sv restart /etc/service/facsite-web-*"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db', 'deploy:symlink_puma'
#after "deploy:restart", "unicorn:stop"
#after "deploy:reload"
after "deploy:update", "deploy:cleanup"
