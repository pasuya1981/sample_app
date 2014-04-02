class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  	  # TODO: sign in user and redirect to the user's show page.
      sign_in(user)
      redirect_back_or user
  	else
  	  flash.now[:error] = "郵件/密碼 錯誤!"
  	  flash.now[:notice] = "請登入"
  	  render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
