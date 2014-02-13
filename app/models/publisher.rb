class Publisher < ActiveRecord::Base
	attr_accessible :name, :description
	has_many :books, :dependent => :destroy
end
