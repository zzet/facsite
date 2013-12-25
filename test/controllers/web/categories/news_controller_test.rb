require "test_helper"

class Web::Categories::NewsControllerTest < ActionController::TestCase
  setup do
    @category = create :category
    @param = { category_id: @category.id }
  end
  test "should get index without news" do
    get :index, @param
    assert_response :success
  end

  test "should get show with news" do
    10.times { @category.news << create(:news) }
    get :index, @param
    assert_response :success
  end

end
