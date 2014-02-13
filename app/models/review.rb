class Review < ActiveRecord::Base
	belongs_to :book
	belongs_to :user
	attr_accessible :user_id, :book_id, :review
	default_scope :order => 'updated_at DESC'
end
