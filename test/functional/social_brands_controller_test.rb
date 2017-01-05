require 'test_helper'

class SocialBrandsControllerTest < ActionController::TestCase
  setup do
    @social_brand = social_brands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_brand" do
    assert_difference('SocialBrand.count') do
      post :create, social_brand: { brand_icon: @social_brand.brand_icon, social_brand: @social_brand.social_brand }
    end

    assert_redirected_to social_brand_path(assigns(:social_brand))
  end

  test "should show social_brand" do
    get :show, id: @social_brand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_brand
    assert_response :success
  end

  test "should update social_brand" do
    put :update, id: @social_brand, social_brand: { brand_icon: @social_brand.brand_icon, social_brand: @social_brand.social_brand }
    assert_redirected_to social_brand_path(assigns(:social_brand))
  end

  test "should destroy social_brand" do
    assert_difference('SocialBrand.count', -1) do
      delete :destroy, id: @social_brand
    end

    assert_redirected_to social_brands_path
  end
end
