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
end
