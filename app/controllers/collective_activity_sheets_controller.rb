class CollectiveActivitySheetsController < ApplicationController
  before_action :set_collective_activity_sheet, only: %i[ show edit update destroy ]

  # GET /collective_activity_sheets or /collective_activity_sheets.json
  def index
    @collective_activity_sheets = CollectiveActivitySheet.all
  end

  # GET /collective_activity_sheets/1 or /collective_activity_sheets/1.json
  def show
    respond_to do |format|
      format.html { render :show, status: :ok }
      format.xml { render :show }
    end
  end

  # GET /collective_activity_sheets/new
  def new
    @collective_activity_sheet = CollectiveActivitySheet.new

    @participant = @collective_activity_sheet.participants.build
    @professional = @collective_activity_sheet.professionals.build
  end

  # GET /collective_activity_sheets/1/edit
  def edit
  end

  # POST /collective_activity_sheets or /collective_activity_sheets.json
  def create
    @collective_activity_sheet = CollectiveActivitySheet.new(collective_activity_sheet_params)

    respond_to do |format|
      if @collective_activity_sheet.save
        format.html { redirect_to collective_activity_sheet_url(@collective_activity_sheet), notice: "Collective activity sheet was successfully created." }
        format.json { render :show, status: :created, location: @collective_activity_sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collective_activity_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collective_activity_sheets/1 or /collective_activity_sheets/1.json
  def update
    respond_to do |format|
      if @collective_activity_sheet.update(collective_activity_sheet_params)
        format.html { redirect_to collective_activity_sheet_url(@collective_activity_sheet), notice: "Collective activity sheet was successfully updated." }
        format.json { render :show, status: :ok, location: @collective_activity_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collective_activity_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collective_activity_sheets/1 or /collective_activity_sheets/1.json
  def destroy
    @collective_activity_sheet.destroy

    respond_to do |format|
      format.html { redirect_to collective_activity_sheets_url, notice: "Collective activity sheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collective_activity_sheet
      @collective_activity_sheet = CollectiveActivitySheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collective_activity_sheet_params
      params.require(:collective_activity_sheet)
            .permit(:uuidFicha,
                    :inep,
                    :numParticipantes,
                    :numAvaliacoesAlterada,
                    :atividadeTipo,
                    :publicoAlvo,
                    :tbCdsOrigem,
                    :procedimento,
                    :turno,
                    :pseEducacao,
                    :pseSaude,
                    :temasParaSaude,
                    :praticasEmSaude,
                    participants_attributes: [
                      :id,
                      :cnsParticipante,
                      :dataNascimento,
                      :avaliacaoAlterada,
                      :cessouHabitoFumar,
                      :abandonouGrupo,
                      :sexo,
                      :_destroy
                    ],
                    professionals_attributes: [
                      :id,
                      :cnsProfissional,
                      :codigoCbo2002,
                      :_destroy
                    ]
                  )
    end
end
