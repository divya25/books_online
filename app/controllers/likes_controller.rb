class LikesController < ApplicationController
  def create
    review_id=params[:like][:review_id]
  	text=current_user.like!(review_id)
  	if text
  	  review = Review.find(review_id)
      render :update do |page|
  		page.replace_html "like_review_#{review_id}", :partial => "books/like_form", :locals => {:review => review}
  	  end
  	end
  end

  def destroy
  	review_id=params[:like][:review_id]
  	text=current_user.unlike!(review_id)
  	if text
  		review = Review.find(review_id)
    	render :update do |page|
  			page.replace_html "like_review_#{review_id}", :partial => "books/like_form", :locals => {:review => review}
  		end
  	end
  end
end
