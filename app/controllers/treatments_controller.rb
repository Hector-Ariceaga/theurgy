class TreatmentsController < ApplicationController
  before_action :current_treatment, only: [:show, :edit, :update, :destroy]

  def index
    @treatments = Treatment.all
  end

  def show
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(treatment_params)

    if @treatment.save
      flash[:message] = "Treatment successfully created."
      redirect_to treatment_path(@treatment)
    else
      flash[:message] = "Treatment creation unsuccessful."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @treatment.update(treatment_params)
      flash[:message] = "Treatment successfully updated."
      redirect_to treatment_path(@treatment)
    else
      flash[:message] = "Treatment update unsuccessful."
      render 'edit'
    end
  end

  def destroy
    if @treatment.destroy
      flash[:message] = "Treatment successfully deleted."
      redirect_to treatments_path
    else
      flash[:message] = "Treatment deletion was unsuccessful"
      redirect_to treatments_path
    end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name, :details)
  end

  def current_treatment
    @treatment = Treatment.find(params[:id])
  end
end
