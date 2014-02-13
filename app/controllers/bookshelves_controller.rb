class BookshelvesController < ApplicationController
  # GET /bookshelves
  # GET /bookshelves.xml
  def create
    Rails.logger.debug("PARAMS=========#{params}");
    book_id=params[:bookshelf][:book_id]
    @book=Book.find(book_id)
    text=current_user.add_book!(book_id)
    render :text => text
  end

  def destroy
    @bookshelf = Bookshelf.find(params[:id])
    @bookshelf.destroy

    respond_to do |format|
      format.html { redirect_to(bookshelves_url) }
      format.xml  { head :ok }
    end
  end

  def index
    @all_books = all
    @read_books = read
    @currently_reading_books = currently_reading
    @to_read_books = to_read

    bookshelf_name=params[:bookshelf_name]
     
    @bookslist=@all_books
    @bookslist=@to_read_books if bookshelf_name == "to_read"
    @bookslist=@currently_reading_books if bookshelf_name == "currently_reading"
    @bookslist=@read_books if bookshelf_name == "read"


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookshelves }
    end
  end


  def all
    current_user.bookshelves
  end

  def read
    current_user.bookshelves.find(:all, :conditions => "status='Read'") 
  end

  def currently_reading
    current_user.bookshelves.find(:all, :conditions => "status='Currently reading'") 
  end

  def to_read
    current_user.bookshelves.find(:all, :conditions => "status='To read'")
  end

=begin
  # GET /bookshelves/1
  # GET /bookshelves/1.xml
  def show
    @bookshelves = current_user.bookshelves

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookshelf }
    end
  end

  # GET /bookshelves/new
  # GET /bookshelves/new.xml
  def new
    @bookshelf = Bookshelf.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookshelf }
    end
  end

  # GET /bookshelves/1/edit
  def edit
    @bookshelf = Bookshelf.find(params[:id])
  end

  # POST /bookshelves
  # POST /bookshelves.xml

def create
    @bookshelf = Bookshelf.new(params[:bookshelf])

    respond_to do |format|
      if @bookshelf.save
        format.html { redirect_to(@bookshelf, :notice => 'Bookshelf was successfully created.') }
        format.xml  { render :xml => @bookshelf, :status => :created, :location => @bookshelf }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end



  # PUT /bookshelves/1
  # PUT /bookshelves/1.xml
  def update
    @bookshelf = Bookshelf.find(params[:id])

    respond_to do |format|
      if @bookshelf.update_attributes(params[:bookshelf])
        format.html { redirect_to(@bookshelf, :notice => 'Bookshelf was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  

=end

end