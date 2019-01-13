class PatientsController < ApplicationController
  before_action :require_log_in
  before_action :admin?, only: [:high_risk]
  before_action :current_patient, except: [:new, :create]
  before_action :current_user, only: [:show, :edit]
  helper_method :current_patient

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
    respond_to do |f|
      f.html
      f.json {render json: @patient}
    end
  end

  def high_risk
    @high_risk_patients = Patient.highest_risk_patients
  end

  def edit
  end

  def update
    if reset_symptoms?
      @patient.symptom_ids = []
      @patient.save
      redirect_to user_patient_path(@patient.user, @patient)
    elsif @patient.update_attributes(patient_params)
      redirect_to user_patient_path(@patient.user, @patient)
    else
      flash[:message] = "Patient was edit was unsuccessful."
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
    params.require(:patient).permit(:patient_id, :name, :dob, :user_id, symptoms:[], diagnosis_ids:[])
  end

  def current_patient
    @patient = Patient.find_by(id: params[:id])
  end

  def reset_symptoms?
    ids = params[:patient][:symptom_ids].reject{|el| el.empty?}
    ids.empty?
  end

end
