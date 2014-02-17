require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  test "should have name and email" do
    member = Member.new
    member.name ='name'
    member.email ='abc@example.com'
    assert member.save
  end
end
