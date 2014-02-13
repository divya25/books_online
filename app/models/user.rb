class User < ActiveRecord::Base
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	
  attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation, :encrypted_password, :admin, :publisher_id, :author_id, :avatar_file, :avatar_small_file, 
          :avatar_thumb_file, :avatar_file_name, :avatar
 
  has_many :bookshelves, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  before_save :save_encrypt_password

  has_attached_file :avatar,
                    :storage => :database,
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :url => '/:class/:id/:attachment?style=:style'

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def has_password?(submitted_password)
    Rails.logger.debug("encrypted_password = #{encrypted_password}");
    Rails.logger.debug("submitted_password = #{submitted_password}");
    Rails.logger.debug("encrypt_submitted_password = #{encrypt(submitted_password)}");
    encrypted_password == encrypt(submitted_password);
  end

  def remember_me!
    self.remember_token = id
    save_without_validation
  end
  

  def has_book?(book)
    bookshelves.find_by_book_id(book.id)
  end
	
  def add_book!(book_id)
    bookshelves.create!(:book_id => book_id)
  end

  def get_review(book_id)
    reviews.find_by_book_id(book_id)
  end

  def likes_review?(review_id)
    likes.find_by_review_id(review_id)
  end

  def like!(review_id)
    likes.create!(:review_id => review_id)
  end

  def unlike!(review_id)
    likes.find_by_review_id(review_id).destroy
  end

  def get_bookshelf(book_id)
    bookshelves.find_by_book_id(book_id)
  end

  def get_rating(book_id)
    ratings.find_by_book_id(book_id)
  end

  def save_encrypt_password
    if password
      self.encrypted_password = encrypt(password);
    end
  end

  def encrypt(password)
    secure_hash("#{password}")
  end 
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
