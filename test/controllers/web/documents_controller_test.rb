require "test_helper"

class Web::DocumentsControllerTest < ActionController::TestCase
  test "should get index without docs" do
    get :index
    assert_response :success
  end

  test "should get index with docs" do
    10.times { create :document }
    get :index
    assert_response :success
  end

  test "should get show" do
    doc = create :document
    get :show, id: doc.id
    assert_response :success
  end

end
