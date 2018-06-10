class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: sessions_params[:email])
    
    if @user && @user.password == sessions_params[:password]
      render json: { auth_token: @user.auth_token }
    else
      render status: :unauthorized
    end
  end

  def destroy
    @user = User.find_by(auth_token: params[:id])
    
    if @user && @user.logout
      render json: { ok: true }
    else
      raise StandardError.new(@user.errors.full_messages)
    end
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end