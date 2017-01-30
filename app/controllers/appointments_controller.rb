class AppointmentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_appointments
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET users/1/appointments
  def index
    @appointments = @user.appointments.order("patient_full_name DESC").page(params[:page])
  end

  # GET users/1/appointments/1
  def show
    @appointment = @user.appointments.find(params[:id])
  end

  # GET users/1/appointments/new
  def new
    @appointment = @user.appointments.build
  end

  # GET users/1/appointments/1/edit
  def edit
  end

  # POST users/1/appointments
  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      redirect_to(@appointment, notice: 'Appointment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/appointments/1
  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to(@appointment, notice: 'Appointment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url(@user)
  end

  # fetch appointments from cliniko
  def fetch_appointments
    begin
      @appointments = Appointment.fetch_from_cliniko
      errors = []
      @appointments.each do |appointment|
        appointment = current_user.appointments.where({
          patient_full_name: appointment["patient_name"],
          appointment_start_time: appointment["appointment_start"],
          appointment_end_time: appointment["appointment_end"],
        }).first_or_initialize

        appointment.save
        errors << appointment.errors.full_messages if appointment.errors.any?
      end
      message = "Successfully fetch appointments data from cliniko"
      message << "\n #{errors.join(",")}" if errors.present?
    rescue => e
      message = e.message
    end
    redirect_to appointments_path, flash: {notice: message}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointments
      @user = current_user
    end

    def set_appointment
      @appointment = @user.appointments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:appointment_start_time, :appointment_end_time, :appointment_full_name, :appointment_mobile_phone, :appointment_home_phone, :appointment_email, :appointment_full_address)
    end
end
