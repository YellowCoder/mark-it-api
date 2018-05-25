require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'should validate the presence of URL' do
    link = Link.new(url: nil)
    assert_not link.valid?
    assert_not_nil link.errors.details[:url]
  end

  test 'should validate the presence of domain' do
    link = Link.new(url: 'http://url.com', domain: nil)
    assert_not link.valid?
    assert_not_nil link.errors.details[:domain]
  end

  test 'should not allow the same url' do
    link = Link.create(url: links(:google).url)
    assert_not link.valid?
    assert_not_nil link.errors.details[:url]
  end
end