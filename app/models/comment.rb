class Comment
  include MongoMapper::Document

  key :text, String, required = true
end
