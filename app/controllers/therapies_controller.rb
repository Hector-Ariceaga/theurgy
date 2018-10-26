class TherapiesController < ApplicationController
  
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
    @therapy = Therapy.find(params[:id])
  end

  def edit
    @therapy = Therapy.find(params[:id])
  end

  def update
    @therapy = Therapy.find(params[:id])
    @therapy.update(params[:active])
    flash[:message] = "Activity status succesfully changed."
    redirect to therapy_path(@therapy)
  end

  #should private params be used here?
end