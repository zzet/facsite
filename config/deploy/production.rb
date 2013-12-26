set :rails_env, 'production'
set :branch, 'master'
set :user, 'facsite'
set :keep_releases, 5
set :deploy_to, '/rest/u/facsite/apps/facsite'

set :db_adapter,     'postgres'
#set :bundle_without, %w[staging development test] + (%w[mysql postgres] - [db_adapter])

role :web, "176.9.30.8"
role :app, "176.9.30.8"
role :db,  "176.9.30.8", primary: true

after "deploy:update_code", "deploy:migrate"
after "deploy:update", "deploy:cleanup"
