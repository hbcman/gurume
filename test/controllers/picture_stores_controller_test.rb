require 'test_helper'

class PictureStoresControllerTest < ActionController::TestCase
  setup do
    @picture_store = picture_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picture_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture_store" do
    assert_difference('PictureStore.count') do
      post :create, picture_store: { picture: @picture_store.picture, store_name: @picture_store.store_name }
    end

    assert_redirected_to picture_store_path(assigns(:picture_store))
  end

  test "should show picture_store" do
    get :show, id: @picture_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture_store
    assert_response :success
  end

  test "should update picture_store" do
    patch :update, id: @picture_store, picture_store: { picture: @picture_store.picture, store_name: @picture_store.store_name }
    assert_redirected_to picture_store_path(assigns(:picture_store))
  end

  test "should destroy picture_store" do
    assert_difference('PictureStore.count', -1) do
      delete :destroy, id: @picture_store
    end

    assert_redirected_to picture_stores_path
  end
end
