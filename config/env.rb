

ENV["APP_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV["APP_ENV"])

configure :development do 
    set :database, {adapter: 'sqlite3', database: 'db/db.sqlite3'}
end

if ENV['SINATRA_ENV'] == 'development'
    require_relative '../secrets'
end

require_all 'app'
# require_relative '../app/controllers/users_controller.rb'