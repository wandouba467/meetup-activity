class Api::Vi::SessionsController < ApplicationController
  def create
     @user = User.find_by(email: create_params[:email])
     if @user && @user.valid_password?(create_params[:password])
       sign_in :user, @user
     else
       return api_error(status: 401)
     end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
 end
