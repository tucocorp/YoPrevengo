require 'test_helper'

class PreventiveProceduresControllerTest < ActionController::TestCase
  setup do
    @preventive_procedure = preventive_procedures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preventive_procedures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preventive_procedure" do
    assert_difference('PreventiveProcedure.count') do
      post :create, preventive_procedure: @preventive_procedure.attributes
    end

    assert_redirected_to preventive_procedure_path(assigns(:preventive_procedure))
  end

  test "should show preventive_procedure" do
    get :show, id: @preventive_procedure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preventive_procedure
    assert_response :success
  end

  test "should update preventive_procedure" do
    put :update, id: @preventive_procedure, preventive_procedure: @preventive_procedure.attributes
    assert_redirected_to preventive_procedure_path(assigns(:preventive_procedure))
  end

  test "should destroy preventive_procedure" do
    assert_difference('PreventiveProcedure.count', -1) do
      delete :destroy, id: @preventive_procedure
    end

    assert_redirected_to preventive_procedures_path
  end
end
