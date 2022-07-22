class CareProceduresController < ApplicationController
  before_action :set_care_procedure, only: %i[ show edit update destroy ]

  # GET /care_procedures or /care_procedures.json
  def index
    @care_procedures = CareProcedure.all
  end

  # GET /care_procedures/1 or /care_procedures/1.json
  def show
  end

  # GET /care_procedures/new
  def new
    @care_procedure = CareProcedure.new
  end

  # GET /care_procedures/1/edit
  def edit
  end

  # POST /care_procedures or /care_procedures.json
  def create
    @care_procedure = CareProcedure.new(care_procedure_params)

    respond_to do |format|
      if @care_procedure.save
        format.html { redirect_to care_procedure_url(@care_procedure), notice: "Care procedure was successfully created." }
        format.json { render :show, status: :created, location: @care_procedure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @care_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /care_procedures/1 or /care_procedures/1.json
  def update
    respond_to do |format|
      if @care_procedure.update(care_procedure_params)
        format.html { redirect_to care_procedure_url(@care_procedure), notice: "Care procedure was successfully updated." }
        format.json { render :show, status: :ok, location: @care_procedure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @care_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /care_procedures/1 or /care_procedures/1.json
  def destroy
    @care_procedure.destroy

    respond_to do |format|
      format.html { redirect_to care_procedures_url, notice: "Care procedure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_procedure
      @care_procedure = CareProcedure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def care_procedure_params
      params.require(:care_procedure).permit(:numProntuario, :cnsCidadao, :dtNascimento, :sexo, :localAtendimento, :turn, :statusEscutaInicialOrientacao, :procedimentos, :dataHoraInicialAtendimento, :dataHoraFinalAtendimento, :pesoAcompanhamentoNutricional, :alturaAcompanhamentoNutricional)
    end
end
