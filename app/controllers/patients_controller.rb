class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    if @patient.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(id: params[:id])
  end

  def update
    @patient = Patient.find(id: params[:id])

    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def destory
    Patient.find(id: params[:id]).delete
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :dob, :symptom_ids[], :diagnosis_ids[])
  end
end
