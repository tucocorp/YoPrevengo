require 'test_helper'

class RiskMatricesControllerTest < ActionController::TestCase
  setup do
    @risk_matrix = risk_matrices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_matrices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_matrix" do
    assert_difference('RiskMatrix.count') do
      post :create, risk_matrix: @risk_matrix.attributes
    end

    assert_redirected_to risk_matrix_path(assigns(:risk_matrix))
  end

  test "should show risk_matrix" do
    get :show, id: @risk_matrix
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_matrix
    assert_response :success
  end

  test "should update risk_matrix" do
    put :update, id: @risk_matrix, risk_matrix: @risk_matrix.attributes
    assert_redirected_to risk_matrix_path(assigns(:risk_matrix))
  end

  test "should destroy risk_matrix" do
    assert_difference('RiskMatrix.count', -1) do
      delete :destroy, id: @risk_matrix
    end

    assert_redirected_to risk_matrices_path
  end
end
