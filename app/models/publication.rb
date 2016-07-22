class Publication
  include MongoMapper::Document
	belongs_to :user
	many :comments

  key :title, String
  key :text, String#, required = true
	key :interest_level, Integer #0-5
	
	key :user_id, BSON::ObjectId

  attr_accessible :text, :title, :interest_level, :user_id

	# def comments
	# 	Comment.where(publication_id: self.id).all
	# end
end
