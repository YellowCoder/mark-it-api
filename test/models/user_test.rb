require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not be valid without values' do
    user = User.new
    assert_not user.valid?
  end

  test 'should generate the password_hash' do
    user = User.new(email: 'email@example.com', password: '123')
    assert_not_nil user.password_hash
  end

  test 'should validate password_hash presence' do
    user = User.new(email: 'email@example.com')
    user.valid?
    assert_not_nil user.errors.details[:password_hash]
  end

  test 'should have auth_token after save' do
    user = User.new(email: 'email@example.com', password: '123')
    assert_nil user.auth_token

    user.save
    assert_not_nil user.auth_token
  end

  test 'should have unique emails' do
    user = User.new(email: users(:adriano).email)
    assert_not user.valid?
  end
end