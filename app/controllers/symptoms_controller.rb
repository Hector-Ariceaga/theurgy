class SymptomsController < ApplicationController
  def index
    @symptoms = Symptom.all
  end
  
  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptom.new(symptom_params)
    
    if @symptom.save
      flash[:message] = "New symptom successfully created."
      redirect_to symptom_path(@symptom)
    else
      render 'new'
    end
  end

  def show
    @symptom = Symptom.find(params[:id])
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    if @symptom.destroy
      flash[:message] = "Symptom successfully deleted."
      redirect_to symptoms_path
    else
      flash[:message] = "Symptom deletion was unsuccessful"
      redirect_to symptoms_path
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end