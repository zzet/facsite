require "test_helper"

class Web::Admin::NewsControllerTest < ActionController::TestCase
  setup do
    10.times { create :news }
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
    attrs = attribures_for(:new)
    post :create, news: attrs
    assert_response :redirect

    new_news = News.last
    assert(new_news.title == attrs[:title])
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    put :update
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
