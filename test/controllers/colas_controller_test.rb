require 'test_helper'

class ColasControllerTest < ActionController::TestCase
  setup do
    @cola = colas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cola" do
    assert_difference('Cola.count') do
      post :create, cola: {  }
    end

    assert_redirected_to cola_path(assigns(:cola))
  end

  test "should show cola" do
    get :show, id: @cola
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cola
    assert_response :success
  end

  test "should update cola" do
    patch :update, id: @cola, cola: {  }
    assert_redirected_to cola_path(assigns(:cola))
  end

  test "should destroy cola" do
    assert_difference('Cola.count', -1) do
      delete :destroy, id: @cola
    end

    assert_redirected_to colas_path
  end
end
