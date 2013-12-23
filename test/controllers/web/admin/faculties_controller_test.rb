require "test_helper"

class Web::Admin::FacultiesControllerTest < ActionController::TestCase
  test "should get show when no faculty" do
    get :show
    assert_response :redirect
  end

  test "should get show when faculty present" do
    create :faculty
    get :show
    assert_response :success
  end

  test "should get edit" do
    create :faculty
    get :edit
    assert_response :success
  end

  test "should get update" do
    faculty = create :faculty
    attrs = attributes_for :faculty
    put :update, faculty: attrs
    assert_response :redirect

    faculty.reload
    assert(faculty.name == attrs[:name])
  end

  test "should get create" do
    attrs = attributes_for :faculty
    post :create, faculty: attrs
    assert_response :redirect

    faculty = Faculty.last
    assert(faculty.name == attrs[:name])
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
