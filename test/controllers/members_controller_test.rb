require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success

    assert_template :new
    assert_select 'title', text:'Address Book (Prototype) App | Sign up'
  end

end
