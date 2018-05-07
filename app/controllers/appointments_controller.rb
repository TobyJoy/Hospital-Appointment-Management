class AppointmentsController < ApplicationController
  
  before_action :find_appointment, only: [:edit, :update]
  
  def new
    @appointment = Appointment.new
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
    create_appointment = @appointment.save
    flash.now[:notice] = "Successfully Created Appointment" if create_appointment
    flash.now[:error] = @appointment.errors.full_messages.uniq.join(', ') if !create_appointment
  end
  
  # def edit
  # end
#   
  # def update
    # updated_appointment = @appointment.update_attributes(appointment_params)
    # flash.now[:notice] = "Successfully Updated Appointment" if updated_appointment
    # flash.now[:error] = @appointment.errors.full_messages.uniq.join(', ') if !updated_appointment
  # end
  
  private
  
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :disease)
  end
  
  # def find_appointment
    # @appointment = Appointment.find_by_id(params[:appointment][:id]) 
  # end
  
end
