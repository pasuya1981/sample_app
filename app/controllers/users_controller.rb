class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

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
  	@users = User.paginate(page: params[:page], order: 'name')
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "使用者: #{user.name}，已被成功刪除"
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "資料成功更新"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: '請登入' 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless correct_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless correct_user.admin?
    end
end
