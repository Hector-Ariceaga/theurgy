class PatientsController < ApplicationController
  def index
    @patients = User.find_by(id: params[:user_id]).patients
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
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to user_patient_path(current_user, @patient)
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])

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
end
