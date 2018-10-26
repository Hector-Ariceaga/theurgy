class DiagnosesController < ApplicationController
  before_action :current_diagnosis, only: [:show, :destroy]
  def index
    @diagnoses = Diagnosis.all
  end
  
  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    
    if @diagnosis.save
      flash[:message] = "New diagnosis successfully created."
      redirect_to diagnosis_path(@diagnosis)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    if @diagnosis.destroy
      flash[:message] = "diagnosis successfully deleted."
      redirect_to diagnosis_path
    else
      flash[:message] = "diagnosis deletion was unsuccessful"
      redirect_to diagnosis_path
    end
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:name)
  end

  def current_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end
end
