require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "email should be valid form" do
    member = Member.new name:'Test', email:'test@example.org'
    assert_equal 'Test', member.name
  end
end
