class SessionsController < ApplicationController
  skip_before_action :authentication_check, only: :create

  def create
    @user = User.find_by(email: sessions_params[:email])
    
    if @user && @user.password == sessions_params[:password]
      render json: { auth_token: @user.auth_token }
    else
      render status: :unauthorized
    end
  end

  def destroy
    if current_user.logout
      render json: { ok: true }
    else
      raise StandardError.new(current_user.errors.full_messages)
    end
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end