class LinkUsersController < ApplicationController
  def check_url
    if current_user.link_users.find_by(link: link)
      render json: { ok: true }
    else
      render status: 404
    end
  end

  def create
    link_user_builder = LinkUserBuilder.new(
      url: link_users_params[:url],
      host: link_users_params[:host],
      user: current_user
    )

    if link_user_builder.save
      render json: { ok: true }
    else
      raise StandardError.new(link_user_builder.link_user.errors.full_messages)
    end
  end

  def destroy
    if link_user = current_user.link_users.find_by(link: link)
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