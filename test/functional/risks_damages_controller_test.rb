require 'test_helper'

class RisksDamagesControllerTest < ActionController::TestCase
  setup do
    @risks_damage = risks_damages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risks_damages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risks_damage" do
    assert_difference('RisksDamage.count') do
      post :create, risks_damage: @risks_damage.attributes
    end

    assert_redirected_to risks_damage_path(assigns(:risks_damage))
  end

  test "should show risks_damage" do
    get :show, id: @risks_damage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risks_damage
    assert_response :success
  end

  test "should update risks_damage" do
    put :update, id: @risks_damage, risks_damage: @risks_damage.attributes
    assert_redirected_to risks_damage_path(assigns(:risks_damage))
  end

  test "should destroy risks_damage" do
    assert_difference('RisksDamage.count', -1) do
      delete :destroy, id: @risks_damage
    end

    assert_redirected_to risks_damages_path
  end
end
