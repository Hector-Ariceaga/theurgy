class DiagnosesController < ApplicationController
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
    @diagnosis = Diagnosis.find(params[:id])
  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])
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
end
