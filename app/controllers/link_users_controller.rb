class LinkUsersController < ApplicationController
  def check_url
    if link
      link_user = user.link_users.find_by(link: link)
      if link_user
        render json: link_user.to_json
      else
        render status: 404
      end
    else
      render status: 404
    end
  end

  def create
    if link
      link_user = user.link_users.create(link: link)
      if link
        render json: link.to_json
      else
        render status: 404
      end
    else
      newLink = Link.create(url: link_users_params[:url])
      link_user = user.link_users.create(link: newLink)
      render json: newLink.to_json
    end
  end

  def destroy_by_url
    if link
      link_user = user.link_users.find_by(link: link)
      if link_user
        link_user.destroy
        render json: { deleted: true }
      else
        render status: 404
      end
    else
      render status: 404
    end
  end

  private

  def link
    @link ||= Link.find_by(url: link_users_params[:url])
  end

  def user
    @user ||= User.find_by(auth_token: link_users_params[:auth_token])
  end
  
  def link_users_params
    params.require(:link_user).permit(:auth_token, :url)
  end
end