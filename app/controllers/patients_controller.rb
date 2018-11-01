class PatientsController < ApplicationController
  before_action :require_log_in, only: [:show, :new, :create, :edit, :update, :destroy]

  def new
    @patient = Patient.new(user_id: params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to user_patient_path(@patient.user, @patient)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @patient = Patient.find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @patient = @user.patients.find_by(id: params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to user_patient_path(@patient.user, @patient)
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
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
    params.require(:patient).permit(:name, :dob, :user_id, symptom_ids:[], diagnosis_ids:[])
  end

end
