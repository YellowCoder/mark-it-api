require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'should authenticate a user that exists' do
    post sessions_url, params: { session: { email: 'adrianotada@gmail.com', password: '123123' } }
    assert_response :success
  end

  test 'should return a 401 status when the user doesn\'t exist' do
    post sessions_url, params: { session: { email: 'ivalid@user.com', password: '123123' } }
    assert_response 401
  end

  test 'should regenerate the auth_token after authenticate' do
    post sessions_url, params: { session: { email: 'adrianotada@gmail.com', password: '123123' } }
    user = User.find_by(email: 'adrianotada@gmail.com')
    assert_not_nil user.auth_token
  end

  test 'should regenerate the auth_token after destroy the session' do
    delete session_url({ id: 'HPmMaBAUvEDhrNcUG3FawkwV' })
    user = User.find_by(auth_token: 'HPmMaBAUvEDhrNcUG3FawkwV')
    assert_nil user
  end
end