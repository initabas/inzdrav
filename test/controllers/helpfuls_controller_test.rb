require 'test_helper'

class HelpfulsControllerTest < ActionController::TestCase
  setup do
    @helpful = helpfuls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:helpfuls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create helpful" do
    assert_difference('Helpful.count') do
      post :create, helpful: { review: @helpful.review, user_id: @helpful.user_id }
    end

    assert_redirected_to helpful_path(assigns(:helpful))
  end

  test "should show helpful" do
    get :show, id: @helpful
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @helpful
    assert_response :success
  end

  test "should update helpful" do
    patch :update, id: @helpful, helpful: { review: @helpful.review, user_id: @helpful.user_id }
    assert_redirected_to helpful_path(assigns(:helpful))
  end

  test "should destroy helpful" do
    assert_difference('Helpful.count', -1) do
      delete :destroy, id: @helpful
    end

    assert_redirected_to helpfuls_path
  end
end
