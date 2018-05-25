require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  test 'should validate the presence of name' do
    domain = Domain.new
    assert_not domain.valid?
    assert_not_nil domain.errors.details[:name]
  end

  test 'should validate the uniqueness of name' do
    domain = Domain.new(name: domains(:google).name)
    assert_not domain.valid?
    assert_not_nil domain.errors.details[:name]
  end
end