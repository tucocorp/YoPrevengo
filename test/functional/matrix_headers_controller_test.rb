require 'test_helper'

class MatrixHeadersControllerTest < ActionController::TestCase
  setup do
    @matrix_header = matrix_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matrix_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matrix_header" do
    assert_difference('MatrixHeader.count') do
      post :create, matrix_header: @matrix_header.attributes
    end

    assert_redirected_to matrix_header_path(assigns(:matrix_header))
  end

  test "should show matrix_header" do
    get :show, id: @matrix_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matrix_header
    assert_response :success
  end

  test "should update matrix_header" do
    put :update, id: @matrix_header, matrix_header: @matrix_header.attributes
    assert_redirected_to matrix_header_path(assigns(:matrix_header))
  end

  test "should destroy matrix_header" do
    assert_difference('MatrixHeader.count', -1) do
      delete :destroy, id: @matrix_header
    end

    assert_redirected_to matrix_headers_path
  end
end
