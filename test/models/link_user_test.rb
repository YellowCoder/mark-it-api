require 'test_helper'

class LinkUserTest < ActiveSupport::TestCase
  test 'should validate the presence of link_id' do
    link_user = LinkUser.new
    assert_not link_user.valid?
    assert_not_nil link_user.errors.details[:link_id]
  end

  test 'should validate the presence of user_id' do
    link_user = LinkUser.new
    assert_not link_user.valid?
    assert_not_nil link_user.errors.details[:user_id]
  end

  test 'should validate uniquess link_id for the scope user_id' do
    link_user = LinkUser.new(link_users(:google).attributes)
    assert_not link_user.valid?
  end
end