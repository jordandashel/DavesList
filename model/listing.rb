require 'mongo_mapper'

class Listing
  include MongoMapper::Document

  set_collection_name "Listing"

  #Attributes
  key :title, String
  key :author, String
  key :description, String
  key :price, Float
  key :date_listed, Date

end
