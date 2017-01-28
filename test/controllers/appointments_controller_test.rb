require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @appointment = appointments(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, params: { user_id: @user, appointment: @appointment.attributes }
    end

    assert_redirected_to user_appointment_path(@user, Appointment.last)
  end

  test "should show appointment" do
    get :show, params: { user_id: @user, id: @appointment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @appointment }
    assert_response :success
  end

  test "should update appointment" do
    put :update, params: { user_id: @user, id: @appointment, appointment: @appointment.attributes }
    assert_redirected_to user_appointment_path(@user, Appointment.last)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, params: { user_id: @user, id: @appointment }
    end

    assert_redirected_to user_appointments_path(@user)
  end
end
