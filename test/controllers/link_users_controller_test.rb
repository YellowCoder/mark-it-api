require 'test_helper'

class TestHelperController < ActionDispatch::IntegrationTest
  test 'should return 404 if the URL doesn\'t exist' do
    user = users(:adriano)
    get check_url_link_users_url, params: { auth_token: user.auth_token, link_user: { url: 'http://newurl.com', host: 'http://newurl.com' }}
    assert_response 404
  end

  test 'should return 404 if the user doesn\'t exist' do
    get check_url_link_users_url, params: { link_user: { url: 'http://newurl.com', host: 'http://newurl.com' }}
    assert_response 404
  end

  test 'should return 200 if the URL exists' do
    user = users(:adriano)
    link_user = link_users(:google)

    get check_url_link_users_url, params: {
      auth_token: user.auth_token,
      link_user: {
        url: link_user.link.url,
        host: link_user.link.domain.name
      }
    }
    assert_response :success
  end
end