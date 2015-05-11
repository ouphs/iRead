class SessionsController < ApplicationController

  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user and @user.password == params[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = 'You\'ve logged in'
  		redirect_to posts_path
  	else
  		flash[:alert] = 'Incorrect password or email'
  		render :new
  	end
  end

  def delete
  	session[:user_id] = nil
  	flash[:notice] = "Logged out"
  	redirect_to root_path
  end  
  
end
