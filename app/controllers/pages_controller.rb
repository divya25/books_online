class PagesController < ApplicationController
  before_filter :authenticate, :only => [:search]

  def home
  	@title="Home"
    #@books=Book.find(:all, :conditions => ['created_at >= :one_day_ago', :one_day_ago => 1.day.ago])
    @books=Book.all
    if signed_in?
      @user=current_user
    else
      @user=User.new
    end
  end

  def search
    unless params[:search].nil?
      keyword=params[:search][:keyword]
      criteria=params[:search][:criteria]
      if keyword.empty?
        @books=nil
      else
        case criteria
        when "all"
          author_ids=Author.find(:all, :select => "id", :conditions => ["name LIKE ?","%#{keyword}%"]).map(&:id).map{|author| author.to_i}
          @books=Book.find(:all, :conditions => ["name LIKE ? OR author_id IN (?)","%#{keyword}%",author_ids])
        when "title"
          @books=Book.find(:all, :conditions => ["name LIKE ?","%#{keyword}%"])
        when "author"
          author_ids=Author.find(:all, :select => "id", :conditions => ["name LIKE ?","%#{keyword}%"]).map(&:id).map{|author| author.to_i}
          @books=Book.find(:all, :conditions => ["author_id IN (?)",author_ids])
        end 
      end
    end
  end

  

  def books
  end

  def friends
  end

  def categories
  end

end
