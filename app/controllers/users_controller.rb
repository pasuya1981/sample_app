class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in(@user)
  	  flash[:notice] = "User: #{@user.name} has been created!"
  	  redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end
end
