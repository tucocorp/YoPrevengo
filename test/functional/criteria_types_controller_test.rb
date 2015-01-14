require 'test_helper'

class CriteriaTypesControllerTest < ActionController::TestCase
  setup do
    @criteria_type = criteria_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criteria_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criteria_type" do
    assert_difference('CriteriaType.count') do
      post :create, criteria_type: @criteria_type.attributes
    end

    assert_redirected_to criteria_type_path(assigns(:criteria_type))
  end

  test "should show criteria_type" do
    get :show, id: @criteria_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criteria_type
    assert_response :success
  end

  test "should update criteria_type" do
    put :update, id: @criteria_type, criteria_type: @criteria_type.attributes
    assert_redirected_to criteria_type_path(assigns(:criteria_type))
  end

  test "should destroy criteria_type" do
    assert_difference('CriteriaType.count', -1) do
      delete :destroy, id: @criteria_type
    end

    assert_redirected_to criteria_types_path
  end
end
