require 'test_helper'

class HqPositionsControllerTest < ActionController::TestCase
  setup do
    @hq_position = hq_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hq_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hq_position" do
    assert_difference('HqPosition.count') do
      post :create, hq_position: { description: @hq_position.description, position_name: @hq_position.position_name }
    end

    assert_redirected_to hq_position_path(assigns(:hq_position))
  end

  test "should show hq_position" do
    get :show, id: @hq_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hq_position
    assert_response :success
  end

  test "should update hq_position" do
    put :update, id: @hq_position, hq_position: { description: @hq_position.description, position_name: @hq_position.position_name }
    assert_redirected_to hq_position_path(assigns(:hq_position))
  end

  test "should destroy hq_position" do
    assert_difference('HqPosition.count', -1) do
      delete :destroy, id: @hq_position
    end

    assert_redirected_to hq_positions_path
  end
end
