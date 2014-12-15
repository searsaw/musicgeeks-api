$:.unshift File.expand_path '..', __FILE__

if ENV['RACK_ENV'].to_sym == :development
  require 'dotenv'
  Dotenv.load
end

require 'grape'
require 'sequel'

db_args = {
  host: 'localhost',
  database: ENV['MUSICGEEKS_PGSQL_DATABASE'],
  user: ENV['MUSICGEEKS_PGSQL_USERNAME'],
  password: ENV['MUSICGEEKS_PGSQL_PASSWORD']
}
DB = Sequel.postgres(db_args)

require 'grape-rabl'

use Rack::Config do |env|
  env['api.tilt.root'] = 'lib/views'
end

Grape::Rabl.configure do |config|
  config.cache_template_loading = true
end

require 'lib/models/song'
require 'lib/app'

run API::Version1