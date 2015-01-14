require 'test_helper'

class UnitaryTasksControllerTest < ActionController::TestCase
  setup do
    @unitary_task = unitary_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unitary_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unitary_task" do
    assert_difference('UnitaryTask.count') do
      post :create, unitary_task: @unitary_task.attributes
    end

    assert_redirected_to unitary_task_path(assigns(:unitary_task))
  end

  test "should show unitary_task" do
    get :show, id: @unitary_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unitary_task
    assert_response :success
  end

  test "should update unitary_task" do
    put :update, id: @unitary_task, unitary_task: @unitary_task.attributes
    assert_redirected_to unitary_task_path(assigns(:unitary_task))
  end

  test "should destroy unitary_task" do
    assert_difference('UnitaryTask.count', -1) do
      delete :destroy, id: @unitary_task
    end

    assert_redirected_to unitary_tasks_path
  end
end
