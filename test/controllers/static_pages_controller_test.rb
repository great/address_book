require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success

    assert_template :home
    assert_select 'h1', text:'Address Book'
  end

  test "should get help" do
    get :help
    assert_response :success

    assert_template :help
    assert_select 'h1', text:'Address Book'
  end
end
