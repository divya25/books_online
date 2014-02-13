class Rating < ActiveRecord::Base
	attr_accessible :user_id, :book_id, :Rating
	belongs_to :book
	belongs_to :user
	default_scope :order => 'updated_at DESC'

end
