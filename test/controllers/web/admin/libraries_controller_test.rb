require "test_helper"

class Web::Admin::LibrariesControllerTest < ActionController::TestCase
  setup do
    10.times { create :library }
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for(:library)
    post :create, library: attrs
    assert_response :redirect

    new_library = Library.last
    assert(new_library.title == attrs[:title])
  end

  test "should get edit" do
    library = create :library

    get :edit, id: library.id
    assert_response :success
  end

  test "should get update" do
    library = create :library
    attrs = attributes_for :library
    put :update, id: library.id, library: attrs
    assert_response :redirect

    library.reload
    assert(library.title == attrs[:title])
  end

  test "should get destroy" do
    library = create :library
    delete :destroy, id: library.id
    assert_response :redirect

    removed_library = Library.find_by(id: library.id)
    assert(removed_library == nil)
  end

  test "should get show" do
    library = create :library
    get :show, id: library.id
    assert_response :success
  end

end
