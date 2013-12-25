require "test_helper"

class Web::Categories::DocumentsControllerTest < ActionController::TestCase
  setup do
    @category = create :category
    @param = { category_id: @category.id }
  end

  test "should get index without documents" do
    get :index, @param
    assert_response :success
  end

  test "should get index with documents" do
    10.times { @category.documents << create(:document) }
    get :index, @param
    assert_response :success
  end
end
