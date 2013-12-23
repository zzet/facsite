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
    attrs = attributes_for(:news)
    post :create, news: attrs
    assert_response :redirect

    new_news = News.last
    assert(new_news.title == attrs[:title])
  end

  test "should get edit" do
    news = create :news

    get :edit, id: news.id
    assert_response :success
  end

  test "should get update" do
    news = create :news
    attrs = attributes_for :news
    put :update, id: news.id, news: attrs
    assert_response :redirect

    news.reload
    assert(news.title == attrs[:title])
  end

  test "should get destroy" do
    news = create :news
    delete :destroy, id: news.id
    assert_response :redirect

    removed_news = News.find_by(id: news.id)
    assert(removed_news == nil)
  end

  test "should get show" do
    news = create :news
    get :show, id: news.id
    assert_response :success
  end

end
