require 'mongo_mapper'

class MongoRepository
  def self.config
    MongoMapper.connection =  Mongo::Connection.new("localhost", 27017)
    MongoMapper.database = "DavesRepo"
  end
end
