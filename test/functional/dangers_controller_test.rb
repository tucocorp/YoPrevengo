require 'test_helper'

class DangersControllerTest < ActionController::TestCase
  setup do
    @danger = dangers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dangers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create danger" do
    assert_difference('Danger.count') do
      post :create, danger: @danger.attributes
    end

    assert_redirected_to danger_path(assigns(:danger))
  end

  test "should show danger" do
    get :show, id: @danger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @danger
    assert_response :success
  end

  test "should update danger" do
    put :update, id: @danger, danger: @danger.attributes
    assert_redirected_to danger_path(assigns(:danger))
  end

  test "should destroy danger" do
    assert_difference('Danger.count', -1) do
      delete :destroy, id: @danger
    end

    assert_redirected_to dangers_path
  end
end
