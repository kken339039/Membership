# `ssh-add`
# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :application, "membership"
set :repo_url, "git@github.com:kken339039/Membership.git"
# set :default_env, { 'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :rbenv_ruby, '2.4.4'

set :deploy_to, '/home/deploy/membership'
set :linked_files, %w(config/database.yml config/secrets.yml .ruby-version)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets public/uploads)
set :keep_releases, 3

set :passenger_restart_with_touch, true
