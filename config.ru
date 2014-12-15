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

require 'lib/models/song'
require 'lib/app'

run API::Version1