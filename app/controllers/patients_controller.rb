class PatientsController < ApplicationController
  before_action :require_log_in
  before_action :current_patient, except: [:new, :create]
  before_action :current_user, only: [:show, :edit]

  def new
    @patient = Patient.new(user_id: params[:user_id])
  end

  def create
    @user = current_user
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to user_patient_path(@patient.user, @patient)
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if @patient.update(patient_params)
      redirect_to user_patient_path(@patient.user, @patient)
    else
      render 'edit'
    end
  end

  def destroy
    if @patient.destroy
      flash[:message] = "Patient successfully deleted."
      redirect_to user_path(@patient)
    else
      flash[:message] = "Patient was deletion was unsuccessful."
      redirect_to user_path(@patient)
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:patient_id, :name, :dob, :user_id, symptom_ids:[], diagnosis_ids:[])
  end

  def current_patient
    @patient = Patient.find(params[:id])
  end
end
