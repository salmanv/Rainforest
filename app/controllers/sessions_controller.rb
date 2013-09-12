class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to products_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, :notice => "Logged out!"
  end

  private

  # def session_params
  #   params.require(:session).permit(:name, :description, :price_in_cents)
  # end
end

=begin def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to products_url, :notice => "Signed up!!"
  	else
  		render "new"
  	end
  end

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

=end 






