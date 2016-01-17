class Task
	include MongoMapper::Document

	key :user_id, ObjectId
	key :name, String
	key :completed, Boolean

	belongs_to :user
end