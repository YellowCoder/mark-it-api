class UsersController < ApplicationController
  def authenticate
    @user = User.find_by(email: user_params[:email])
    
    if @user && @user.password == user_params[:password]
      render json: { auth_token: @user.auth_token }
    else
      render status: :unauthorized
    end
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      render json: { success: true }
    else 
      raise StandardError.new(@user.errors.full_messages)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end