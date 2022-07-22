class ProcedureSheetsController < ApplicationController
  before_action :set_procedure_sheet, only: %i[ show edit update destroy ]

  # GET /procedure_sheets or /procedure_sheets.json
  def index
    @procedure_sheets = ProcedureSheet.all
  end

  # GET /procedure_sheets/1 or /procedure_sheets/1.json
  def show
  end

  # GET /procedure_sheets/new
  def new
    @procedure_sheet = ProcedureSheet.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure_sheet
      @procedure_sheet = ProcedureSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def procedure_sheet_params
      params.require(:procedure_sheet).permit(:uuidFicha, :tpCdsOrigem, :numTotalAfericaoPa, :numTotalAfericaoTemperatura, :numTotalCurativoSimples, :numTotalColetaMaterialParaExameLaboratorial, :numTotalGlicemiaCapilar, :numTotalMedicaoAltura, :numTotalMedicaoPeso)
    end
end
