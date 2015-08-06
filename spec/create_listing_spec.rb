require 'rspec'
require_relative 'spec_helper'
require_relative '../app'

describe 'DavesListController' do

  describe "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "POST '/create'" do
    include Rack::Test::Methods
    it "returns 204 for empty title" do
      params = {
        title: 'a'
      }

      post '/create', params, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
      expect(last_response).to be_redirect
    end
  end
end
