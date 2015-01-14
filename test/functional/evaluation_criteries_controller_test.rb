require 'test_helper'

class EvaluationCriteriesControllerTest < ActionController::TestCase
  setup do
    @evaluation_critery = evaluation_criteries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_criteries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_critery" do
    assert_difference('EvaluationCritery.count') do
      post :create, evaluation_critery: @evaluation_critery.attributes
    end

    assert_redirected_to evaluation_critery_path(assigns(:evaluation_critery))
  end

  test "should show evaluation_critery" do
    get :show, id: @evaluation_critery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_critery
    assert_response :success
  end

  test "should update evaluation_critery" do
    put :update, id: @evaluation_critery, evaluation_critery: @evaluation_critery.attributes
    assert_redirected_to evaluation_critery_path(assigns(:evaluation_critery))
  end

  test "should destroy evaluation_critery" do
    assert_difference('EvaluationCritery.count', -1) do
      delete :destroy, id: @evaluation_critery
    end

    assert_redirected_to evaluation_criteries_path
  end
end
