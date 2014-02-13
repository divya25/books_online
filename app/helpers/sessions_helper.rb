module SessionsHelper

  def sign_in(user)
    user.remember_me!
    cookies[:remember_token] = { :value   => user.remember_token, :expires => 20.years.from_now.utc }
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token     
  end

  def user_from_remember_token
    remember_token = cookies[:remember_token]
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end
  
  def get_book_info(book_id)
    Book.find_by_id(book_id)
  end

  def get_avg_rating(book_id)
    sum = Rating.sum(:Rating, :conditions => ['book_id == :book_id', :book_id => book_id]) 
    no_of_rating = Rating.count(:Rating, :conditions => ['book_id == :book_id', :book_id => book_id])
    if no_of_rating == 0 
      0
    else
      sum/no_of_rating
    end
  end

  def authenticate
      deny_access unless signed_in?
    end

  def deny_access
    store_location
    flash[:notice]="Please sign in to access the page"
    redirect_to root_path
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def clear_return_to
    session[:return_to] = nil
  end
  
=begin
def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user     
  end

  def sign_in(user)
	  self.current_user = user
  end

  
=end

end
