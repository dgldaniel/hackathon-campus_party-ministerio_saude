class ProblemConditionEvaluatedsController < ApplicationController
  before_action :set_problem_condition_evaluated, only: %i[ show edit update destroy ]

  # GET /problem_condition_evaluateds or /problem_condition_evaluateds.json
  def index
    @problem_condition_evaluateds = ProblemConditionEvaluated.all
  end

  # GET /problem_condition_evaluateds/1 or /problem_condition_evaluateds/1.json
  def show
  end

  # GET /problem_condition_evaluateds/new
  def new
    @problem_condition_evaluated = ProblemConditionEvaluated.new
  end

  # GET /problem_condition_evaluateds/1/edit
  def edit
  end

  # POST /problem_condition_evaluateds or /problem_condition_evaluateds.json
  def create
    @problem_condition_evaluated = ProblemConditionEvaluated.new(problem_condition_evaluated_params)

    respond_to do |format|
      if @problem_condition_evaluated.save
        format.html { redirect_to problem_condition_evaluated_url(@problem_condition_evaluated), notice: "Problem condition evaluated was successfully created." }
        format.json { render :show, status: :created, location: @problem_condition_evaluated }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @problem_condition_evaluated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_condition_evaluateds/1 or /problem_condition_evaluateds/1.json
  def update
    respond_to do |format|
      if @problem_condition_evaluated.update(problem_condition_evaluated_params)
        format.html { redirect_to problem_condition_evaluated_url(@problem_condition_evaluated), notice: "Problem condition evaluated was successfully updated." }
        format.json { render :show, status: :ok, location: @problem_condition_evaluated }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @problem_condition_evaluated.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_condition_evaluateds/1 or /problem_condition_evaluateds/1.json
  def destroy
    @problem_condition_evaluated.destroy

    respond_to do |format|
      format.html { redirect_to problem_condition_evaluateds_url, notice: "Problem condition evaluated was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_condition_evaluated
      @problem_condition_evaluated = ProblemConditionEvaluated.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_condition_evaluated_params
      params.require(:problem_condition_evaluated).permit(:ciaps, :outroCiap1, :cid10, :cid10_2)
    end
end
