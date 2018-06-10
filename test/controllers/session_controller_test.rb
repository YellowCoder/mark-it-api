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
    user = users(:adriano)
    initial_auth_token = user.auth_token

    delete session_url({ id: 1, auth_token: user.auth_token })

    user = User.find_by(auth_token: initial_auth_token)
    assert_nil user
  end
end