require "test_helper"

class Web::Admin::EventsControllerTest < ActionController::TestCase
  setup do
    10.times { create :event }
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
    attrs = attributes_for(:event)
    post :create, event: attrs
    assert_response :redirect

    new_event = Event.last
    assert(new_event.title == attrs[:title])
  end

  test "should get edit" do
    event = create :event

    get :edit, id: event.id
    assert_response :success
  end

  test "should get update" do
    event = create :event
    attrs = attributes_for :event
    put :update, id: event.id, event: attrs
    assert_response :redirect

    event.reload
    assert(event.title == attrs[:title])
  end

  test "should get destroy" do
    event = create :event
    delete :destroy, id: event.id
    assert_response :redirect

    removed_event = Event.find_by(id: event.id)
    assert(removed_event == nil)
  end

  test "should get show" do
    event = create :event
    get :show, id: event.id
    assert_response :success
  end

end
