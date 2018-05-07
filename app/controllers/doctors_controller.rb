class DoctorsController < ApplicationController
  
  before_action :find_doctor, only: [:edit, :update]
  
  def new
    @doctor = Docter.new
  end
  
  def create
    @doctor = Doctor.new(doc_params)
    create_doc = @doctor.save
    flash.now[:notice] = "Successfully Created Doctor" if create_doc
    flash.now[:error] = @doctor.errors.full_messages.uniq.join(', ') if !create_doc
  end
  
  # def edit
  # end
#   
  # def update
    # updated_doc = @doctor.update_attributes(doc_params)
    # flash.now[:notice] = "Successfully Updated Doctor" if updated_doc
    # flash.now[:error] = @doctor.errors.full_messages.uniq.join(', ') if !update_doc
  # end
  
  private
  
  def doc_params
    params.require(:doctor).permit(:name, :phone_number, :specification)
  end
  
  # def find_doctor
    # @doctor = Doctor.find_by_id(params[:doctor][:id]) 
  # end
  
end
