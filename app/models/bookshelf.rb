class Bookshelf < ActiveRecord::Base
  attr_accessible :book_id, :status, :read_count, :notes, :user_id
  belongs_to :book
  belongs_to :user
end
