require 'test_helper'

class ShrinesControllerTest < ActionController::TestCase
  setup do
    @shrine = shrines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shrines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shrine" do
    assert_difference('Shrine.count') do
      post :create, shrine: { address: @shrine.address, detail: @shrine.detail, hp: @shrine.hp, latitude: @shrine.latitude, longitude: @shrine.longitude, name: @shrine.name, name_hiragana: @shrine.name_hiragana, name_katakana: @shrine.name_katakana, tags: @shrine.tags }
    end

    assert_redirected_to shrine_path(assigns(:shrine))
  end

  test "should show shrine" do
    get :show, id: @shrine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shrine
    assert_response :success
  end

  test "should update shrine" do
    patch :update, id: @shrine, shrine: { address: @shrine.address, detail: @shrine.detail, hp: @shrine.hp, latitude: @shrine.latitude, longitude: @shrine.longitude, name: @shrine.name, name_hiragana: @shrine.name_hiragana, name_katakana: @shrine.name_katakana, tags: @shrine.tags }
    assert_redirected_to shrine_path(assigns(:shrine))
  end

  test "should destroy shrine" do
    assert_difference('Shrine.count', -1) do
      delete :destroy, id: @shrine
    end

    assert_redirected_to shrines_path
  end
end
