class Writer
  include MongoMapper::Document

  key :name, String
  key :number_of_posts, Integer

end
