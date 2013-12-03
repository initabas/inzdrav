require 'test_helper'

class FormaVypuskasControllerTest < ActionController::TestCase
  setup do
    @forma_vypuska = forma_vypuskas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forma_vypuskas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forma_vypuska" do
    assert_difference('FormaVypuska.count') do
      post :create, forma_vypuska: { name: @forma_vypuska.name }
    end

    assert_redirected_to forma_vypuska_path(assigns(:forma_vypuska))
  end

  test "should show forma_vypuska" do
    get :show, id: @forma_vypuska
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forma_vypuska
    assert_response :success
  end

  test "should update forma_vypuska" do
    patch :update, id: @forma_vypuska, forma_vypuska: { name: @forma_vypuska.name }
    assert_redirected_to forma_vypuska_path(assigns(:forma_vypuska))
  end

  test "should destroy forma_vypuska" do
    assert_difference('FormaVypuska.count', -1) do
      delete :destroy, id: @forma_vypuska
    end

    assert_redirected_to forma_vypuskas_path
  end
end
