require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @harry = students(:harry)
  end

  test "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "shows student" do
    get :show, :id => @harry
    assert_response :success
    assert_not_nil assigns(:student)
  end

  test "gets new" do
    get :new
    assert_response :success
  end

  test "creates a new student" do
    assert_difference('Student.count') do
      post :create, :student => { :name => "Ron Weasley" }
    end

    assert_redirected_to students_path( assigns(:student) )
  end

  test "redirects to a #new if student is not present" do
    post :create
    assert_redirected_to '/students/new'
  end

  test "redirects to a #new if student is invalid" do
    post :create, :student => { :name => nil }
    assert_redirected_to '/students/new'
  end

end
