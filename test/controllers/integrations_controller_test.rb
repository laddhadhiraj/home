require 'test_helper'

class IntegrationsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @integration = integrations(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create integration" do
    assert_difference('Integration.count') do
      post :create, params: { user_id: @user, integration: @integration.attributes }
    end

    assert_redirected_to user_integration_path(@user, Integration.last)
  end

  test "should show integration" do
    get :show, params: { user_id: @user, id: @integration }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @integration }
    assert_response :success
  end

  test "should update integration" do
    put :update, params: { user_id: @user, id: @integration, integration: @integration.attributes }
    assert_redirected_to user_integration_path(@user, Integration.last)
  end

  test "should destroy integration" do
    assert_difference('Integration.count', -1) do
      delete :destroy, params: { user_id: @user, id: @integration }
    end

    assert_redirected_to user_integrations_path(@user)
  end
end
