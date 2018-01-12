require 'test_helper'

class DocumentFilesControllerTest < ActionController::TestCase
  setup do
    @document_file = document_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_file" do
    assert_difference('DocumentFile.count') do
      post :create, document_file: { filename: @document_file.filename, title: @document_file.title }
    end

    assert_redirected_to document_file_path(assigns(:document_file))
  end

  test "should show document_file" do
    get :show, id: @document_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_file
    assert_response :success
  end

  test "should update document_file" do
    put :update, id: @document_file, document_file: { filename: @document_file.filename, title: @document_file.title }
    assert_redirected_to document_file_path(assigns(:document_file))
  end

  test "should destroy document_file" do
    assert_difference('DocumentFile.count', -1) do
      delete :destroy, id: @document_file
    end

    assert_redirected_to document_files_path
  end
end
