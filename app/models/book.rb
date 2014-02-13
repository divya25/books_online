class Book < ActiveRecord::Base
	belongs_to :category 
	belongs_to :author
	belongs_to :publisher
	has_many :ratings, :dependent => :destroy
	has_many :reviews, :dependent => :destroy
	has_many :bookshelves, :dependent => :destroy
	default_scope :order => 'created_at DESC'

	has_attached_file :avatar,
                    :storage => :database,
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :url => '/:class/:id/:attachment?style=:style'

    #default_scope select_without_file_columns_for(:avatar)

	attr_accessible :name, :description, :publisher_id, :author_id, :category_id, :avatar_file, :avatar_small_file, 
					:avatar_thumb_file, :avatar, :avatar_file_name, :number_of_pages

	def get_reviews
	  reviews
	end

	def get_ratings
		ratings
	end
end

