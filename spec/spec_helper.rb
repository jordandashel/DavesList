require 'sinatra'
require "sinatra/base"
require 'rack/test'
require_relative '../app'

def app
  Daveslist.new
end

RSpec.configure do |config|
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end
