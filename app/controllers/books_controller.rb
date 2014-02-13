class BooksController < ApplicationController
	def new
	  @book=Book.new
	end
	def create
	  @book = Book.new(params[:book])
	  if @book.save
		redirect_to @book
	  else
		render 'new'
	  end
	end
	def index
		@books = Book.paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@book=Book.find(params[:id])
		@user_bookshelf=current_user.get_bookshelf(@book.id)
		Rails.logger.debug("########## #{@book.id}")
	end

	def show_image
      book = Book.find(params[:id])
      style = params[:style] ? params[:style] : :original
      send_data book.avatar.file_contents(style), 
      				:type => book.avatar_content_type, :disposition => 'inline'
  end

 #  	def show_image
	# 	book = Book.find(params[:id])
	# 	send_data book.avatar.file_contents(:small), 
	# 	:type => 'image/png', :disposition => 'inline'
	# end
end
