class ProcedureSheetsController < ApplicationController
  before_action :set_procedure_sheet, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /procedure_sheets or /procedure_sheets.json
  def index
    @procedure_sheets = ProcedureSheet.all
  end

  # GET /procedure_sheets/1 or /procedure_sheets/1.json
  def show
    respond_to do |format|
      format.html { render :show, status: :ok }
      format.xml { render :show }
    end
  end

  # GET /procedure_sheets/new
  def new
    @procedure_sheet = ProcedureSheet.new
    @care_procedure = @procedure_sheet.care_procedures.build
  end

  # GET /procedure_sheets/1/edit
  def edit
  end

  # POST /procedure_sheets or /procedure_sheets.json
  def create
    @procedure_sheet = ProcedureSheet.new(procedure_sheet_params)

    respond_to do |format|
      if @procedure_sheet.save
        format.html { redirect_to procedure_sheet_url(@procedure_sheet), notice: "Procedure sheet was successfully created." }
        format.json { render :show, status: :created, location: @procedure_sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @procedure_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedure_sheets/1 or /procedure_sheets/1.json
  def update
    respond_to do |format|
      if @procedure_sheet.update(procedure_sheet_params)
        format.html { redirect_to procedure_sheet_url(@procedure_sheet), notice: "Procedure sheet was successfully updated." }
        format.json { render :show, status: :ok, location: @procedure_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @procedure_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_sheets/1 or /procedure_sheets/1.json
  def destroy
    @procedure_sheet.destroy

    respond_to do |format|
      format.html { redirect_to procedure_sheets_url, notice: "Procedure sheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_xml_zip
    procudures_selected = ProcedureSheet.generate_xml_from params[:start_date], params[:end]

    GenerateXmlProcedureSheetJob.perform_now procudures_selected, current_user

    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure_sheet
      @procedure_sheet = ProcedureSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def procedure_sheet_params
      params.require(:procedure_sheet)
            .permit(:uuidFicha,
                    :tpCdsOrigem,
                    :numTotalAfericaoPa,
                    :numTotalAfericaoTemperatura,
                    :numTotalCurativoSimples,
                    :numTotalColetaMaterialParaExameLaboratorial,
                    :numTotalGlicemiaCapilar,
                    :numTotalMedicaoAltura,
                    :numTotalMedicaoPeso,
                    :xml_file,
                    care_procedures_attributes: [
                      :id,
                      :numProntuario,
                      :cnsCidadao,
                      :dtNascimento,
                      :sexo,
                      :localAtendimento,
                      :turn,
                      :statusEscutaInicialOrientacao,
                      :procedimentos,
                      :dataHoraInicialAtendimento,
                      :dataHoraFinalAtendimento,
                      :pesoAcompanhamentoNutricional,
                      :alturaAcompanhamentoNutricional,
                      :_destroy
                    ]
                    )
    end
end
