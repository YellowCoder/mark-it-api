class LinkUserBuilder
  def initialize(url:, host:, user:)
    @url = url
    @host = host
    @user = user
  end

  def create!
    link_user.save
  end

  def link_user
    @user.link_users.where(link: link).first_or_initialize
  end

  private

  def domain
    @domain ||= Domain.where(name: @host).first_or_create
  end

  def link
    @link ||= Link.where(url: @url, domain: domain).first_or_create
  end
end