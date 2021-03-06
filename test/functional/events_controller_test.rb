require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { contact_info: @event.contact_info, details: @event.details, event_URL: @event.event_URL, event_end: @event.event_end, event_start: @event.event_start, event_statuses_id: @event.event_statuses_id, event_title: @event.event_title, graphic_address: @event.graphic_address, location_id: @event.location_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { contact_info: @event.contact_info, details: @event.details, event_URL: @event.event_URL, event_end: @event.event_end, event_start: @event.event_start, event_statuses_id: @event.event_statuses_id, event_title: @event.event_title, graphic_address: @event.graphic_address, location_id: @event.location_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
