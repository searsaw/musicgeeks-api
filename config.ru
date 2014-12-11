$:.unshift File.expand_path '..', __FILE__

if ENV['RACK_ENV']
  require 'dotenv'
  Dotenv.load
end

require 'lib/app'

run API::Version1