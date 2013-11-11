require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:ravenclaw)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should show house" do
    get :show, :id => @house
    assert_response :success
  end

end
