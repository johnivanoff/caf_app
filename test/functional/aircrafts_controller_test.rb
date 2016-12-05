require 'test_helper'

# sign_in @user, :scope => 'admin'

class AircraftsControllerTest < ActionController::TestCase
  setup do
    @aircraft = aircrafts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircrafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft" do
    assert_difference('Aircraft.count') do
      post :create, aircraft: { description: @aircraft.description, n_number: @aircraft.n_number, name: @aircraft.name, nose_art: @aircraft.nose_art }
    end

    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should show aircraft" do
    get :show, id: @aircraft
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft
    assert_response :success
  end

  test "should update aircraft" do
    put :update, id: @aircraft, aircraft: { description: @aircraft.description, n_number: @aircraft.n_number, name: @aircraft.name, nose_art: @aircraft.nose_art }
    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should destroy aircraft" do
    assert_difference('Aircraft.count', -1) do
      delete :destroy, id: @aircraft
    end

    assert_redirected_to aircrafts_path
  end
end
