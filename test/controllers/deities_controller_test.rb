require 'test_helper'

class DeitiesControllerTest < ActionController::TestCase
  setup do
    @deity = deities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deity" do
    assert_difference('Deity.count') do
      post :create, deity: { detail: @deity.detail, name: @deity.name, name_hiragana: @deity.name_hiragana, name_katakana: @deity.name_katakana, tags: @deity.tags }
    end

    assert_redirected_to deity_path(assigns(:deity))
  end

  test "should show deity" do
    get :show, id: @deity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deity
    assert_response :success
  end

  test "should update deity" do
    patch :update, id: @deity, deity: { detail: @deity.detail, name: @deity.name, name_hiragana: @deity.name_hiragana, name_katakana: @deity.name_katakana, tags: @deity.tags }
    assert_redirected_to deity_path(assigns(:deity))
  end

  test "should destroy deity" do
    assert_difference('Deity.count', -1) do
      delete :destroy, id: @deity
    end

    assert_redirected_to deities_path
  end
end
