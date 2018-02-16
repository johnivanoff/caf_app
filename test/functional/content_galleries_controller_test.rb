require 'test_helper'

class ContentGalleriesControllerTest < ActionController::TestCase
  setup do
    @content_gallery = content_galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_gallery" do
    assert_difference('ContentGallery.count') do
      post :create, content_gallery: { caption: @content_gallery.caption, image: @content_gallery.image, photographer: @content_gallery.photographer }
    end

    assert_redirected_to content_gallery_path(assigns(:content_gallery))
  end

  test "should show content_gallery" do
    get :show, id: @content_gallery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_gallery
    assert_response :success
  end

  test "should update content_gallery" do
    put :update, id: @content_gallery, content_gallery: { caption: @content_gallery.caption, image: @content_gallery.image, photographer: @content_gallery.photographer }
    assert_redirected_to content_gallery_path(assigns(:content_gallery))
  end

  test "should destroy content_gallery" do
    assert_difference('ContentGallery.count', -1) do
      delete :destroy, id: @content_gallery
    end

    assert_redirected_to content_galleries_path
  end
end
