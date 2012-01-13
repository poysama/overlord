require 'test_helper'

class ServerserviceinfosControllerTest < ActionController::TestCase
  setup do
    @serverserviceinfo = serverserviceinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serverserviceinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serverserviceinfo" do
    assert_difference('Serverserviceinfo.count') do
      post :create, serverserviceinfo: @serverserviceinfo.attributes
    end

    assert_redirected_to serverserviceinfo_path(assigns(:serverserviceinfo))
  end

  test "should show serverserviceinfo" do
    get :show, id: @serverserviceinfo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serverserviceinfo.to_param
    assert_response :success
  end

  test "should update serverserviceinfo" do
    put :update, id: @serverserviceinfo.to_param, serverserviceinfo: @serverserviceinfo.attributes
    assert_redirected_to serverserviceinfo_path(assigns(:serverserviceinfo))
  end

  test "should destroy serverserviceinfo" do
    assert_difference('Serverserviceinfo.count', -1) do
      delete :destroy, id: @serverserviceinfo.to_param
    end

    assert_redirected_to serverserviceinfos_path
  end
end
