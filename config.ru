$:.unshift File.expand_path '..', __FILE__

if ENV['RACK_ENV'].to_sym == :development
  require 'dotenv'
  Dotenv.load
end

require 'grape'

require 'lib/app'

run API::Version1