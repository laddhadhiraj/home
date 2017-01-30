require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @patient = patients(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, params: { user_id: @user, patient: @patient.attributes }
    end

    assert_redirected_to user_patient_path(@user, Patient.last)
  end

  test "should show patient" do
    get :show, params: { user_id: @user, id: @patient }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @patient }
    assert_response :success
  end

  test "should update patient" do
    put :update, params: { user_id: @user, id: @patient, patient: @patient.attributes }
    assert_redirected_to user_patient_path(@user, Patient.last)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, params: { user_id: @user, id: @patient }
    end

    assert_redirected_to user_patients_path(@user)
  end
end
