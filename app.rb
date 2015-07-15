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

  get '/details/:id' do
    @listing = Listing.find(params[:id])
    erb :details
  end

  get '/create' do
    erb :create
  end

  post '/create' do
    newListing = Listing.create!(:title => params[:title],
    :author => params[:author],
    :description => params[:description],
    :price => params[:price],
    :date_listed => params[:date])
     redirect "/details/#{newListing._id}"
  end

  get '/delete/:id' do

  end


end
