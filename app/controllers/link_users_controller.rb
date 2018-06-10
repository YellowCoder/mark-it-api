class LinkUsersController < ApplicationController
  def check_url
    if current_user&.link_users&.find_by(link: link)
      render json: { ok: true }
    else
      render status: 404
    end
  end

  def create
    if link
      link_user = current_user.link_users.create(link: link)
      if link
        render json: link.to_json
      else
        render status: 404
      end
    else
      domain = Domain.where(name: link_users_params[:host]).first_or_create
      newLink = Link.where(url: link_users_params[:url], domain: domain).first_or_create
      link_user = current_user.link_users.where(link_id: newLink.id).first_or_create
      render json: newLink.to_json
    end
  end

  def destroy
    if link_user = current_user&.link_users&.find_by(link: link)
      link_user.destroy
      render json: { deleted: true }
    else
      render status: 404
    end
  end

  private

  def link
    @link ||= Link.find_by(url: link_users_params[:url])
  end
  
  def link_users_params
    params.require(:link_user).permit(:url, :host)
  end
end