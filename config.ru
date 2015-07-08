require 'rubygems'
require './app'
require 'sinatra'

map '/' do
  run Daveslist
end
