$:.unshift File.expand_path '..', __FILE__

if ENV['RACK_ENV'].to_sym == :development
  require 'dotenv'
  require 'pry'
  Dotenv.load
end

require 'grape'
require 'sequel'
require 'oj'
require 'grape-rabl'

db_args = {
  host: 'localhost',
  database: ENV['MUSICGEEKS_PGSQL_DATABASE'],
  user: ENV['MUSICGEEKS_PGSQL_USERNAME'],
  password: ENV['MUSICGEEKS_PGSQL_PASSWORD']
}
DB = Sequel.postgres(db_args)

use Rack::Config do |env|
  env['api.tilt.root'] = 'lib/views'
end

Rabl.configure do |config|
  config.include_json_root = true
  config.include_child_root = false
end

Grape::Rabl.configure do |config|
  config.cache_template_loading = true
end

require 'lib/models/song'
require 'lib/models/user'
require 'lib/models/access_token'
require 'lib/app'

run API::Version1