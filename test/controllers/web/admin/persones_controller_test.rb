require "test_helper"

class Web::Admin::PersonesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for(:persone)
    post :create, persone: attrs
    assert_response :redirect

    persone = Persone.last
    assert { persone.name == attrs[:name] }
  end

  test "should get show" do
    persone = create :persone
    get :show, id: persone.id
    assert_response :success
  end

  test "should get edit" do
    persone = create :persone
    get :edit, id: persone.id
    assert_response :success
  end

  test "should get update" do
    persone = create :persone
    attrs = attributes_for :persone
    put :update, id: persone.id, persone: attrs
    assert_response :redirect

    persone.reload
    assert { persone.name == attrs[:name]}
  end

  test "should get destroy" do
    persone = create :persone
    delete :destroy, id: persone.id
    assert_response :redirect

    removed_persone = Persone.find_by(id: persone.id)
    assert { removed_persone == nil }
  end

end
