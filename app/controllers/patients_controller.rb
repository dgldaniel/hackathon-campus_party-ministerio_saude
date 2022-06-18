# frozen_string_literal: true
class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    # params.delete(:situation_options) if params[:situation_options].blank?

    @patients = case params[:situation_options]
    when 'ok'
      Patient.joins(:report).where(
          'reports.situation > :value',
          { value: 0.7 }
        ).where(doctor_id: current_user.id)
    when 'warning'
      Patient.joins(:report).where(
          'reports.situation >= :value1 AND reports.situation <= :value2',
          { value1: 0.5, value2: 0.7 }
        ).where(doctor_id: current_user.id)
    when 'bad'
      Patient.joins(:report).where(
          'reports.situation < :value',
          { value: 0.5 }
        ).where(doctor_id: current_user.id)
    else
      Patient.where(doctor_id: current_user.id)
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
    @gender_types = Patient.gender_types
    @patient.build_address
    @patient.build_report
  end

  # GET /patients/1/edit
  def edit
    @gender_types = Patient.gender_types
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.doctor = current_user.doctor
    @gender_types = Patient.gender_types

    respond_to do |format|
      if @patient.save
        format.html do
          redirect_to(@patient, notice: 'Patient was successfully created.')
        end
        format.json { render(:show, status: :created, location: @patient) }
      else
        format.html { render(:new) }
        format.json do
          render(json: @patient.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @gender_types = Patient.gender_types

    respond_to do |format|
      if @patient.update(patient_params)
        format.html do
          redirect_to(@patient, notice: 'Patient was successfully updated.')
        end
        format.json { render(:show, status: :ok, location: @patient) }
      else
        format.html { render(:edit) }
        format.json do
          render(json: @patient.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html do
        redirect_to(patients_url, notice: 'Patient was successfully destroyed.')
      end
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patient_params
    params.require(:patient).permit(
      :email,
      :full_name,
      :age,
      :gender,
      :phone,
      :address_id,
      :doctor_id,
      :situation_options,
      address_attributes: %i[street number state city complement zip_code],
      report_attributes: %i[
        hba1c
        ldc
        pa
        medical_adhesion
        algorithm_adherence
        use_AAS
        use_stain
        pains_feet_hands
        waist_measured_ratio
        microalbuminuria_evaluation
        blurred_vision
        periodontal_disease_evaluation
        depression_assessment
        presence_stroke_coronary_heart_disease
        influenza_vaccination
        h1n1_antipneumococcal
        participation_diabetes_nutritional_education_program
        smoker
      ]
    )
  end
end
