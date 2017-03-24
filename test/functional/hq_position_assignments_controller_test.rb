require 'test_helper'

class HqPositionAssignmentsControllerTest < ActionController::TestCase
  setup do
    @hq_position_assignment = hq_position_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hq_position_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hq_position_assignment" do
    assert_difference('HqPositionAssignment.count') do
      post :create, hq_position_assignment: {  }
    end

    assert_redirected_to hq_position_assignment_path(assigns(:hq_position_assignment))
  end

  test "should show hq_position_assignment" do
    get :show, id: @hq_position_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hq_position_assignment
    assert_response :success
  end

  test "should update hq_position_assignment" do
    put :update, id: @hq_position_assignment, hq_position_assignment: {  }
    assert_redirected_to hq_position_assignment_path(assigns(:hq_position_assignment))
  end

  test "should destroy hq_position_assignment" do
    assert_difference('HqPositionAssignment.count', -1) do
      delete :destroy, id: @hq_position_assignment
    end

    assert_redirected_to hq_position_assignments_path
  end
end
