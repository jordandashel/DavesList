require 'rubygems'
require 'sinatra/base'
require 'mongo_mapper'
require_relative 'model/listing'

class Daveslist < Sinatra::Base

  configure do
    MongoMapper.connection =  Mongo::Connection.new("localhost", 27017)
    MongoMapper.database = "DavesRepo"


  end


  get '/' do
    @listings = Listing.all
    erb :index
  end



end
