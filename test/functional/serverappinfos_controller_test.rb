require 'test_helper'

class ServerappinfosControllerTest < ActionController::TestCase
  setup do
    @serverappinfo = serverappinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serverappinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serverappinfo" do
    assert_difference('Serverappinfo.count') do
      post :create, serverappinfo: @serverappinfo.attributes
    end

    assert_redirected_to serverappinfo_path(assigns(:serverappinfo))
  end

  test "should show serverappinfo" do
    get :show, id: @serverappinfo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serverappinfo.to_param
    assert_response :success
  end

  test "should update serverappinfo" do
    put :update, id: @serverappinfo.to_param, serverappinfo: @serverappinfo.attributes
    assert_redirected_to serverappinfo_path(assigns(:serverappinfo))
  end

  test "should destroy serverappinfo" do
    assert_difference('Serverappinfo.count', -1) do
      delete :destroy, id: @serverappinfo.to_param
    end

    assert_redirected_to serverappinfos_path
  end
end
