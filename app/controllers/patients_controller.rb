class PatientsController < ApplicationController
  before_action :current_patient, only: [:show, :edit, :update, :destroy]
  before_action :requre_log_in, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :admin? [:index]

  def index
    @patients = Patients.all
  end

  def show
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @patient = Patient.new
  end

  def create
    raise params.inspect
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    if @patient.save
      redirect_to user_patient_path(current_user, @patient)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to user_patient_path(current_user, @patient)
    else
      render 'edit'
    end
  end

  def destroy
    if @patient.destroy
      flash[:message] = "Patient successfully deleted."
      redirect_to user_patients_path
    else
      flash[:message] = "Patient was deletion was unsuccessful."
      redirect_to user_patients_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :dob, :symptom_ids[], :diagnosis_ids[])
  end

  def current_patient
    @patient = Patient.find(params[:id])
  end
end
