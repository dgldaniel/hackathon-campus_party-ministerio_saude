# frozen_string_literal: true
class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /report
  # GET /report.json
  def index
    @reports = Report.all
  end

  # GET /report/1
  # GET /report/1.json
  def show; end

  # GET /report/new
  def new
    @report = Report.new
  end

  # GET /report/1/edit
  def edit; end

  # POST /report
  # POST /report.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save!
        format.html do
          redirect_to(@report, notice: 'Report was successfully created.')
        end
        format.json { render(:show, status: :created, location: @report) }
      else
        format.html { render(:new) }
        format.json do
          render(json: @report.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # PATCH/PUT /report/1
  # PATCH/PUT /report/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html do
          redirect_to(@report, notice: 'Report was successfully updated.')
        end
        format.json { render(:show, status: :ok, location: @report) }
      else
        format.html { render(:edit) }
        format.json do
          render(json: @report.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # DELETE /report/1
  # DELETE /report/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html do
        redirect_to(
          report_index_url,
          notice: 'Report was successfully destroyed.'
        )
      end
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(
      :hba1c,
      :ldc,
      :pa,
      :medical_adhesion,
      :algorithm_adherence,
      :use_AAS,
      :use_stain,
      :pains_feet_hands,
      :waist_measured_ratio,
      :microalbuminuria_evaluation,
      :blurred_vision,
      :periodontal_disease_evaluation,
      :depression_assessment,
      :presence_stroke_coronary_heart_disease,
      :influenza_vaccination,
      :h1n1_antipneumococcal,
      :participation_diabetes_nutritional_education_program,
      :smoker,
      :situation
    )
  end
end
