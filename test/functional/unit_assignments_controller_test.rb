require 'test_helper'

class UnitAssignmentsControllerTest < ActionController::TestCase
  setup do
    @unit_assignment = unit_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_assignment" do
    assert_difference('UnitAssignment.count') do
      post :create, unit_assignment: {  }
    end

    assert_redirected_to unit_assignment_path(assigns(:unit_assignment))
  end

  test "should show unit_assignment" do
    get :show, id: @unit_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_assignment
    assert_response :success
  end

  test "should update unit_assignment" do
    put :update, id: @unit_assignment, unit_assignment: {  }
    assert_redirected_to unit_assignment_path(assigns(:unit_assignment))
  end

  test "should destroy unit_assignment" do
    assert_difference('UnitAssignment.count', -1) do
      delete :destroy, id: @unit_assignment
    end

    assert_redirected_to unit_assignments_path
  end
end
