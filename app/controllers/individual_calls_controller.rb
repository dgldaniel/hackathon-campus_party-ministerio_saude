# frozen_string_literal: true
class IndividualCallsController < ApplicationController
  before_action :set_individual_call, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /individual_calls or /individual_calls.json
  def index
    @individual_calls = current_user.doctor.individual_calls
  end

  # GET /individual_calls/1 or /individual_calls/1.json
  def show
    respond_to do |format|
      format.html { render(:show, status: :ok) }
      format.xml { render(:show) }
    end
  end

  # GET /individual_calls/new
  def new
    @individual_call = IndividualCall.new

    @individual_call.build_problem_condition_evaluated
    @individual_call.exams.build
    @individual_call.exam_results.build
    @individual_call.medicines.build
    @individual_call.forwardings.build

    @options = IndividualCall.build_options
  end

  # GET /individual_calls/1/edit
  def edit
    @options = IndividualCall.build_options
  end

  # POST /individual_calls or /individual_calls.json
  def create
    @individual_call = IndividualCall.new(individual_call_params)
    @individual_call.doctor = current_user.doctor

    respond_to do |format|
      if @individual_call.save
        format.html { redirect_to(individual_call_url(@individual_call), notice: "Individual call was successfully created.") }
        format.json { render(:show, status: :created, location: @individual_call) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @individual_call.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /individual_calls/1 or /individual_calls/1.json
  def update
    respond_to do |format|
      if @individual_call.update(individual_call_params)
        format.html { redirect_to(individual_call_url(@individual_call), notice: "Individual call was successfully updated.") }
        format.json { render(:show, status: :ok, location: @individual_call) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @individual_call.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /individual_calls/1 or /individual_calls/1.json
  def destroy
    @individual_call.destroy

    respond_to do |format|
      format.html { redirect_to(individual_calls_url, notice: "Individual call was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_individual_call
      @individual_call = IndividualCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def individual_call_params
      params.require(:individual_call)
            .permit(:numeroProntuario,
                    :cnsCidadao,
                    :dataNascimento,
                    :localDeAtendimento,
                    :sexo,
                    :turno,
                    :tipoAtendimento,
                    :pesoAcompanhamentoNutricional,
                    :alturaAcompanhamentoNutricional,
                    :aleitamentoMaterno,
                    :dumDaGestante,
                    :idadeGestacional,
                    :atencaoDomiciliarModalidade,
                    :vacinaEmDia,
                    :ficouEmObservacao,
                    :nasfs,
                    :condutas,
                    :stGravidezPlanejada,
                    :nuGestasPrevias,
                    :nuPartos,
                    :racionalidadeSaude,
                    :perimetroCefalico,
                    :dataHoraInicialAtendimento,
                    :dataHoraFinalAtendimento,
                    problem_condition_evaluated_attributes: [
                      :id,
                      :ciaps,
                      :outroCiap1,
                      :cid10,
                      :cid10_2,
                      :_destroy,
                    ],
                    exams_attributes: [
                      :id,
                      :codigoExame,
                      :solicitadoAvaliado,
                      :_destroy,
                    ],
                    exam_results_attributes: [
                      :id,
                      :exame,
                      :dataSolicitacao,
                      :dataRealizacao,
                      :dataResultado,
                      :tipoResultado,
                      :valorResultado,
                      :_destroy,
                    ],
                    medicines_attributes: [
                      :id,
                      :codigoCatmat,
                      :viaAdministracao,
                      :dose,
                      :doseUnica,
                      :usoContinuo,
                      :doseFrequenciaTipo,
                      :doseFrequencia,
                      :doseFrequenciaQuantidade,
                      :doseFrequenciaUnidadeMedida,
                      :dtInicioTratamento,
                      :duracaoTratamento,
                      :duracaoTratamentoMedida,
                      :quantidadeReceitada,
                      :_destroy,
                    ],
                    forwardings_attributes: [
                      :id,
                      :especialidade,
                      :hipoteseDiagnosticoCid10,
                      :classificacaoRisco,
                      :_destroy,
                    ]
                   )
    end
end
