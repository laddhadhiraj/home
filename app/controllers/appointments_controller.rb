class AppointmentsController < ApplicationController
  before_action :set_appointments
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET users/1/appointments
  def index
    @appointments = @user.appointments
  end

  # GET users/1/appointments/1
  def show
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
      redirect_to([@appointment.user, @appointment], notice: 'Appointment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/appointments/1
  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to([@appointment.user, @appointment], notice: 'Appointment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/appointments/1
  def destroy
    @appointment.destroy

    redirect_to user_appointments_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointments
      @user = User.find(params[:user_id])
    end

    def set_appointment
      @appointment = @user.appointments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:appointment_start_time, :appointment_end_time, :patient_full_name, :patient_mobile_phone, :patient_home_phone, :patient_email, :patient_full_address)
    end
end
