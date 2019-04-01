# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

group :development do
   gem 'sqlite3'    #gem to use in development environment
end

group :production do
  gem 'pg'         #gem to use in production environment
end

run Rails.application
