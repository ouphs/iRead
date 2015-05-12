class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	#a security feature RoR forms require, only allows a user to create or update only the attribures whitelisted.
  
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	# set_user <-- before_action command replaces this set_user
  end

  def edit
  	# set_user <-- before_action command replaces this set_user
  end

  def create
  	# set_user <-- before_action command replaces this set_user
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = 'New account created'
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = 'There was a problem'
  		render :new
  	end
end

  def update
    # set_user <--  <-- before_action command replaces this set_user
    @user.update(user_params)
    flash[:notice] = "Your account was updated"
    redirect_to user_path(@user) # can also be just @user RoR knows its a shortcut
  end


  def destroy
  	# set_user  <--  before_action command replaces this set_user
  	@user.destroy
    session[:user_id] = nil
  	flash[:notice] = "User was deleted"
    redirect_to users_path
  end

private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:fname, :lname, :email, :email_confirmation :password) #this is a vey specific syntax, MEMORIZE it a.s.a.p.
  end

end