require "test_helper"

class Web::CategoriesControllerTest < ActionController::TestCase
  test "should get index without categories" do
    get :index
    assert_response :success
  end

  test "should get index with categories" do
    create :category
    get :index
    assert_response :success
  end

  test "should get show" do
    category = create :category
    get :show, id: category.slug
    assert_response :success
  end

end
