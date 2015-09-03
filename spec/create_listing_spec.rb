require 'rspec'
require_relative 'spec_helper'
require_relative '../app'

describe 'DavesListController' do
  describe "GET '/'" do
    it "loads homepage" do
      allow(Listing).to receive(:all).and_return([createFakeListing])
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "POST '/create'" do
    include Rack::Test::Methods
    it "redirects to new listing" do
      allow(Listing).to receive(:create!)
        .and_return(OpenStruct.new({ "_id" => 1 }))
      params = {
        title: 'a'}
      post '/create', params, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
      expect(last_response).to be_redirect
      expect(last_response.location).to include('/details/1')
    end
  end

  describe "GET '/details'" do
    include Rack::Test::Methods
    context 'id exists' do
      it 'loads the listing details' do
        allow(Listing).to receive(:find)
          .and_return({:title => "Title1"})
        get '/details/1' do
          expect(last_response).to be_ok
          expect(last_response.body).to include("Title1")
        end
      end
    end
    context 'id doesnt exist' do
      it 'redirects to error page' do
        allow(Listing).to receive(:find)
          .and_return(nil)
        get '/details', :id => 1
        #expect(last_response).to be_redirect
        expect(last_response.body).to include('Not Found')
      end
    end
  end

  def createFakeListing
    listing = OpenStruct.new({ "_id" => 1 });
    listing
  end
end
