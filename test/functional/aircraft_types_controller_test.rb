require 'test_helper'

class AircraftTypesControllerTest < ActionController::TestCase
  setup do
    @aircraft_type = aircraft_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircraft_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft_type" do
    assert_difference('AircraftType.count') do
      post :create, aircraft_type: { bombs: @aircraft_type.bombs, ceiling: @aircraft_type.ceiling, cost: @aircraft_type.cost, crew: @aircraft_type.crew, cruise_speed: @aircraft_type.cruise_speed, description: @aircraft_type.description, empty_weight: @aircraft_type.empty_weight, fuel_burn: @aircraft_type.fuel_burn, fuel_capacity: @aircraft_type.fuel_capacity, gross_weight: @aircraft_type.gross_weight, guns: @aircraft_type.guns, hardpoints: @aircraft_type.hardpoints, height: @aircraft_type.height, introduced: @aircraft_type.introduced, length: @aircraft_type.length, manufacturer: @aircraft_type.manufacturer, max_speed: @aircraft_type.max_speed, max_weight: @aircraft_type.max_weight, oil_capacity: @aircraft_type.oil_capacity, power: @aircraft_type.power, production_years: @aircraft_type.production_years, qty_produced: @aircraft_type.qty_produced, qty_still_flying: @aircraft_type.qty_still_flying, range: @aircraft_type.range, rockets: @aircraft_type.rockets, role: @aircraft_type.role, type: @aircraft_type.type, wingspan: @aircraft_type.wingspan }
    end

    assert_redirected_to aircraft_type_path(assigns(:aircraft_type))
  end

  test "should show aircraft_type" do
    get :show, id: @aircraft_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft_type
    assert_response :success
  end

  test "should update aircraft_type" do
    put :update, id: @aircraft_type, aircraft_type: { bombs: @aircraft_type.bombs, ceiling: @aircraft_type.ceiling, cost: @aircraft_type.cost, crew: @aircraft_type.crew, cruise_speed: @aircraft_type.cruise_speed, description: @aircraft_type.description, empty_weight: @aircraft_type.empty_weight, fuel_burn: @aircraft_type.fuel_burn, fuel_capacity: @aircraft_type.fuel_capacity, gross_weight: @aircraft_type.gross_weight, guns: @aircraft_type.guns, hardpoints: @aircraft_type.hardpoints, height: @aircraft_type.height, introduced: @aircraft_type.introduced, length: @aircraft_type.length, manufacturer: @aircraft_type.manufacturer, max_speed: @aircraft_type.max_speed, max_weight: @aircraft_type.max_weight, oil_capacity: @aircraft_type.oil_capacity, power: @aircraft_type.power, production_years: @aircraft_type.production_years, qty_produced: @aircraft_type.qty_produced, qty_still_flying: @aircraft_type.qty_still_flying, range: @aircraft_type.range, rockets: @aircraft_type.rockets, role: @aircraft_type.role, type: @aircraft_type.type, wingspan: @aircraft_type.wingspan }
    assert_redirected_to aircraft_type_path(assigns(:aircraft_type))
  end

  test "should destroy aircraft_type" do
    assert_difference('AircraftType.count', -1) do
      delete :destroy, id: @aircraft_type
    end

    assert_redirected_to aircraft_types_path
  end
end
