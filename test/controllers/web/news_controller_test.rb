require "test_helper"

class Web::NewsControllerTest < ActionController::TestCase
  test "should get index without news" do
    get :index
    assert_response :success
  end

  test "should get index with news" do
    10.times { create(:news) }
    get :index
    assert_response :success
  end


  test "should get show" do
    news = create :news
    get :show, id: news.id
    assert_response :success
  end

end
