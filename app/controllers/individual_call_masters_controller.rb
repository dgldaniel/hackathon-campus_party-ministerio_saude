# frozen_string_literal: true
class IndividualCallMastersController < ApplicationController
  before_action :set_individual_call_master, only: %i[show edit update destroy]

  # GET /individual_call_masters or /individual_call_masters.json
  def index
    @individual_call_masters = IndividualCallMaster.all
  end

  # GET /individual_call_masters/1 or /individual_call_masters/1.json
  def show
  end

  # GET /individual_call_masters/new
  def new
    @individual_call_master = IndividualCallMaster.new

    individual_calls_builded = @individual_call_master.individual_calls.build
    individual_calls_builded.build_problem_condition_evaluated
    individual_calls_builded.exams.build
    individual_calls_builded.exam_results.build
    individual_calls_builded.medicines.build
    individual_calls_builded.forwardings.build

    @options = IndividualCallMaster.build_options
  end

  # GET /individual_call_masters/1/edit
  def edit
    @options = IndividualCallMaster.build_options
  end

  # POST /individual_call_masters or /individual_call_masters.json
  def create
    @individual_call_master = IndividualCallMaster.new(individual_call_master_params)
    @individual_call_master.doctor = current_user.doctor

    @options = IndividualCallMaster.build_options

    respond_to do |format|
      if @individual_call_master.save
        format.html { redirect_to(individual_call_master_url(@individual_call_master), notice: "Individual call master was successfully created.") }
        format.json { render(:show, status: :created, location: @individual_call_master) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @individual_call_master.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /individual_call_masters/1 or /individual_call_masters/1.json
  def update
    @options = IndividualCallMaster.build_options

    respond_to do |format|
      if @individual_call_master.update(individual_call_master_params)
        format.html { redirect_to(individual_call_master_url(@individual_call_master), notice: "Individual call master was successfully updated.") }
        format.json { render(:show, status: :ok, location: @individual_call_master) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @individual_call_master.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /individual_call_masters/1 or /individual_call_masters/1.json
  def destroy
    @individual_call_master.destroy

    respond_to do |format|
      format.html { redirect_to(individual_call_masters_url, notice: "Individual call master was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_individual_call_master
      @individual_call_master = IndividualCallMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def individual_call_master_params
      params.require(:individual_call_master).permit(:tpCdsOrigem, :uuid)
    end
end
