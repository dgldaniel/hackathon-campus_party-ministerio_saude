class ExamResultsController < ApplicationController
  before_action :set_exam_result, only: %i[ show edit update destroy ]

  # GET /exam_results or /exam_results.json
  def index
    @exam_results = ExamResult.all
  end

  # GET /exam_results/1 or /exam_results/1.json
  def show
  end

  # GET /exam_results/new
  def new
    @exam_result = ExamResult.new
  end

  # GET /exam_results/1/edit
  def edit
  end

  # POST /exam_results or /exam_results.json
  def create
    @exam_result = ExamResult.new(exam_result_params)

    respond_to do |format|
      if @exam_result.save
        format.html { redirect_to exam_result_url(@exam_result), notice: "Exam result was successfully created." }
        format.json { render :show, status: :created, location: @exam_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_results/1 or /exam_results/1.json
  def update
    respond_to do |format|
      if @exam_result.update(exam_result_params)
        format.html { redirect_to exam_result_url(@exam_result), notice: "Exam result was successfully updated." }
        format.json { render :show, status: :ok, location: @exam_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_results/1 or /exam_results/1.json
  def destroy
    @exam_result.destroy

    respond_to do |format|
      format.html { redirect_to exam_results_url, notice: "Exam result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_result
      @exam_result = ExamResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_result_params
      params.require(:exam_result).permit(:exame, :dataSolicitacao, :dataRealizacao, :dataResultado, :result_id)
    end
end
