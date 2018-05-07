class PatientsController < ApplicationController

  before_action :find_patient, only: [:edit, :update]
  
  def create
    @patient = Patient.new(patient_params)
    create_patient = @patient.save
    flash.now[:notice] = "Successfully Created Patient" if create_patient
    flash.now[:error] = @patient.errors.full_messages.uniq.join(', ') if !create_patient
  end
  
  # def edit
  # end
#   
  # def update
    # updated_patient = @patient.update_attributes(patient_params)
    # flash.now[:notice] = "Successfully Updated Patient" if updated_patient
    # flash.now[:error] = @patient.errors.full_messages.uniq.join(', ') if !updated_patient
  # end
  
  private
  
  def patient_params
    params.require(:patient).permit(:name, :phone_number)
  end
  
  # def find_patient
    # @patient = Patient.find_by_id(params[:patient][:id]) 
  # end
  
end
