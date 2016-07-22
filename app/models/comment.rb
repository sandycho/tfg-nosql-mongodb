class Comment
  include MongoMapper::EmbeddedDocument
  belongs_to :publication

  key :c_title, String, required = true
  key :c_text, String, required = true
	key :c_interest_level, Integer #0-5

  key :publication_id
  attr_accessible :c_text, :c_title, :c_interest_level, :publication_id
end
