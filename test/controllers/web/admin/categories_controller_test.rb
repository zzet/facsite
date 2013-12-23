require "test_helper"

class Web::Admin::CategoriesControllerTest < ActionController::TestCase
  test "should get index without categories" do
    get :index
    assert_response :success
  end

  test "should get index with categories" do
    10.times { create :category }

    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for(:category)
    post :create, category: attrs
    assert_response :redirect

    new_category = Category.last
    assert(new_category.name == attrs[:name])
  end

  test "should get edit" do
    category = create :category

    get :edit, id: category.id
    assert_response :success
  end

  test "should get update" do
    category = create :category

    attrs = attributes_for(:category)
    put :update, id: category.id, category: attrs
    assert_response :redirect

    category.reload
    assert(category.name == attrs[:name])
  end

  test "should get destroy" do
    category = create :category

    delete :destroy, id: category.id
    assert_response :redirect

    removed_category = Category.find_by(id: category.id)
    assert(removed_category == nil)
  end

end
