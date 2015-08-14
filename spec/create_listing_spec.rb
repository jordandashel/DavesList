require 'rspec'
require_relative 'spec_helper'
require_relative '../app'
require_relative '../model/mongoRepository'

describe 'DavesListController' do
  before(:each) do
    allow(MongoRepository).to receive(:config)
  end

  describe "GET '/'" do
    it "loads homepage" do
      allow(Listing).to receive(:all).and_return([createFakeListing])
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "POST '/create'" do
    include Rack::Test::Methods
    it "returns 204 for empty title" do
      allow(Listing).to receive(:create!)
        .and_return(OpenStruct.new({ "_id" => 1 }))

      params = {
        title: 'a'
      }
      post '/create', params, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/details/1')
    end
  end

  def createFakeListing
    listing = OpenStruct.new({ "_id" => 1 });
    listing
  end
end
