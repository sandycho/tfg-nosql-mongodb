class User
	include MongoMapper::Document
	many :publications

	key :name, String
	key :priority, Integer
	key :age, Integer
	key :driver, Boolean

  attr_accessible :name, :priority, :age, :driver
end