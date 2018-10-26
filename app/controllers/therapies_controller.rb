class TherapiesController < ApplicationController
  before_action :current_therapy, only: [:show, :edit, :update]
  
  def create
    @therapy = Therapy.new(patient_id: params[:patient_id], treatment_id: params[:treatment_id], active: params[:active])
    
    if @therapy.save
      flash[:message] = "Sucessfully added a therapy."
      redirect_to patient_path(@therapy.patient)
    else
      flash[:message] = "Adding a therapy was unsuccessful."
      redirect_to patient_path(@therapy.patient)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @therapy.update(params[:active])
      flash[:message] = "Activity status succesfully changed."
      redirect to therapy_path(@therapy)
    else
      flash[:message] = "Activity update unsuccessful."
      redirect_to therapy_path(@therapy)
    end
  end

  private

  def current_therapy
    @therapy = Therapy.find(params[:id])
  end

  #should private params be used here?
end