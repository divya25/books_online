class SessionsController < ApplicationController
  def create
  	  @user = User.authenticate(params[:sessions][:email], params[:sessions][:password])
  	  if @user.nil?
  	  	flash.now[:error] = "Invalid email/password combination."
  	  	@title = "Sign in"
  	  else
  	  	@title = @user.name
  	  	sign_in @user	
        flash.now[:success] = "Hey #{current_user.name }"
  	  end
      redirect_to root_path
	end

	def destroy
		@title = "Sign out"
    sign_out
    redirect_to root_path
	end
end
