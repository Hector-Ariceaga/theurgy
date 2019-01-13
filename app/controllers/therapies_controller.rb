class TherapiesController < ApplicationController
  before_action :current_therapy, only: [:show, :edit, :update]
  before_action :require_log_in

  def create
    @therapy = Therapy.new(patient_id: params[:patient_id], active: params[:active], treatment_id: params[:therapy][:treatment_id])

    if @therapy.save
      flash[:message] = "Sucessfully added a therapy."
      render json: @therapy
    else
      flash[:message] = "Adding a therapy was unsuccessful."
      redirect_to user_patient_path(current_user, @therapy.patient)
    end
  end

  def show
    render json: @therapy
  end

  def edit
  end

  def update
    if @therapy.update(therapy_params)
      flash[:message] = "Activity status succesfully changed."
      redirect_to user_patient_path(current_user, @therapy.patient)
    else
      flash[:message] = "Activity update unsuccessful."
      redirect_to user_patient_path(current_user, @therapy.patient)
    end
  end

  def destroy
    @therapy= Therapy.find(params[:id])
    if @therapy.delete
      flash[:message] = "Therapy succesfully deleted."
      redirect_to user_patient_path(current_user, @therapy.patient)
    else
      flash[:message] = "Deleting therapy was unsuccessful."
      redirect_to user_patient_path(current_user, @therapy.patient)
    end
  end

  private

  def current_therapy
    @therapy = Therapy.find(params[:id])
  end

  def therapy_params
    params.require(:therapy).permit(:patient_id, :active, :treatment_id)
  end
end
