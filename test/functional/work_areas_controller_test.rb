require 'test_helper'

class WorkAreasControllerTest < ActionController::TestCase
  setup do
    @work_area = work_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_area" do
    assert_difference('WorkArea.count') do
      post :create, work_area: @work_area.attributes
    end

    assert_redirected_to work_area_path(assigns(:work_area))
  end

  test "should show work_area" do
    get :show, id: @work_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_area
    assert_response :success
  end

  test "should update work_area" do
    put :update, id: @work_area, work_area: @work_area.attributes
    assert_redirected_to work_area_path(assigns(:work_area))
  end

  test "should destroy work_area" do
    assert_difference('WorkArea.count', -1) do
      delete :destroy, id: @work_area
    end

    assert_redirected_to work_areas_path
  end
end
