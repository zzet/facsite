require "test_helper"

class Web::Admin::DocumentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for :document
    post :create, document: attrs
    assert_response :redirect

    new_document = Document.last
    assert(new_document.title == attrs[:title])
  end

  test "should get edit" do
    document = create :document
    get :edit, id: document.id
    assert_response :success
  end

  test "should get update" do
    document = create :document
    attrs = attributes_for :document
    put :update, id: document.id, document: attrs
    assert_response :redirect

    document.reload
    assert(document.title == attrs[:title])
  end

  test "should get destroy" do
    document = create :document
    delete :destroy, id: document.id
    assert_response :redirect

    removed_document = Document.find_by(id: document.id)
    assert(removed_document == nil)
  end

end
