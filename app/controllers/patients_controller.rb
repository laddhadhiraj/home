class PatientsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_patients
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET users/1/patients
  def index
    @patients = @user.patients
  end

  # GET users/1/patients/1
  def show
      @patient = @user.patients.find(params[:id])
  end

  # GET users/1/patients/new
  def new
    @patient = @user.patients.build
  end

  # GET users/1/patients/1/edit
  def edit
  end

  # POST users/1/patients
  def create
    @patient = @user.patients.build(patient_params)

    if @patient.save
      redirect_to(@patient, notice: 'Patient was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/patients/1
  def update
    if @patient.update_attributes(patient_params)
      redirect_to(@patient, notice: 'Patient was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/patients/1
  def destroy
    @patient.destroy
    redirect_to patients_url(@user)
  end

  # fetch patients from cliniko
  def fetch_patients
    begin
      @patients = Patient.fetch_from_cliniko
      errors = []
      @patients.each do |pat|
        patient = current_user.patients.where({
          patient_first_name: pat["first_name"],
          patient_last_name: pat["last_name"],
          patient_dob: pat["date_of_birth"],
          patient_mobile_phone: get_patient_phone_type(pat, "Mobile"),
          patient_home_phone: get_patient_phone_type(pat, "Home"),
          patient_work_phone: get_patient_phone_type(pat, "Work")
        }).first_or_initialize

        patient.save
        errors << patient.errors.full_messages if patient.errors.any?
      end
      message = "Successfully fetch patients data from cliniko"
      message << "\n #{errors.join(",")}" if errors.present?
    rescue => e
      message = e.message
    end
    redirect_to patients_path, flash: {notice: message}
  end

  private
    def get_patient_phone_type(patient,phone_type)
      phone_number = patient["patient_phone_numbers"].map{|p| p if p["phone_type"] == phone_type}
      phone_number.compact[0]["number"] rescue nil
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_patients
      @user = current_user
    end

    def set_patient
      @patient = @user.patients.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patient_params
      params.require(:patient).permit(:patient_full_name, :patient_first_name, :patient_last_name, :patient_dob, :patient_mobile_phone, :patient_home_phone, :patient_work_phone)
    end


end
