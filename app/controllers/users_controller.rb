class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  	  flash[:notice] = "User: #{@user.name} has been created!"
  	  redirect_to users_path
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
