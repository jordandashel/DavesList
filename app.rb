require 'rubygems'
require 'sinatra/base'
require_relative 'model/listing'
require_relative './Validator'
require_relative 'model/mongoRepository'

class Daveslist < Sinatra::Base

  configure do
    #MongoRepository.config
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
    puts params
    puts params.class
    Validator.has_title?(params)

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
