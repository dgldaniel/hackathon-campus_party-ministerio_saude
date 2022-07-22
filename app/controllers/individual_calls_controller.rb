class IndividualCallsController < ApplicationController
  before_action :set_individual_call, only: %i[ show edit update destroy ]

  # GET /individual_calls or /individual_calls.json
  def index
    @individual_calls = IndividualCall.all
  end

  # GET /individual_calls/1 or /individual_calls/1.json
  def show
  end

  # GET /individual_calls/new
  def new
    @individual_call = IndividualCall.new
  end

  # GET /individual_calls/1/edit
  def edit
  end

  # POST /individual_calls or /individual_calls.json
  def create
    @individual_call = IndividualCall.new(individual_call_params)

    respond_to do |format|
      if @individual_call.save
        format.html { redirect_to individual_call_url(@individual_call), notice: "Individual call was successfully created." }
        format.json { render :show, status: :created, location: @individual_call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @individual_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_calls/1 or /individual_calls/1.json
  def update
    respond_to do |format|
      if @individual_call.update(individual_call_params)
        format.html { redirect_to individual_call_url(@individual_call), notice: "Individual call was successfully updated." }
        format.json { render :show, status: :ok, location: @individual_call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @individual_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_calls/1 or /individual_calls/1.json
  def destroy
    @individual_call.destroy

    respond_to do |format|
      format.html { redirect_to individual_calls_url, notice: "Individual call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_call
      @individual_call = IndividualCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def individual_call_params
      params.require(:individual_call).permit(:numeroProntuario, :cnsCidadao, :dataNascimento, :localDeAtendimento, :sexo, :turno, :tipoAtendimento, :pesoAcompanhamentoNutricional, :alturaAcompanhamentoNutricional, :aleitamentoMaterno, :dumDaGestante, :idadeGestacional, :atencaoDomiciliarModalidade, :vacinaEmDia, :ficouEmObservacao, :nasfs, :condutas, :stGravidezPlanejada, :nuGestasPrevias, :nuPartos, :racionalidadeSaude, :perimetroCefalico, :dataHoraInicialAtendimento, :dataHoraFinalAtendimento, :ExamResult_id, :Professional_id, :Participant_id, :CollectiveActivitySheet_id, :Exam_id, :Medicine_id, :Forwarding_id, :ExamResult_id)
    end
end
