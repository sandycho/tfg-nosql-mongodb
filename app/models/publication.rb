class Publication
  include MongoMapper::Document

  key :title, String, required = true
  key :text, String, required = true
	key :interest_level, Integer #0-5

	many :comments

end
