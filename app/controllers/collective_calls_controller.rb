class CollectiveCallsController < ApplicationController
  before_action :set_collective_call, only: %i[ show edit update destroy ]

  # GET /collective_calls or /collective_calls.json
  def index
    @collective_calls = CollectiveCall.all
  end

  # GET /collective_calls/1 or /collective_calls/1.json
  def show
  end

  # GET /collective_calls/new
  def new
    @collective_call = CollectiveCall.new
  end

  # GET /collective_calls/1/edit
  def edit
  end

  # POST /collective_calls or /collective_calls.json
  def create
    @collective_call = CollectiveCall.new(collective_call_params)

    respond_to do |format|
      if @collective_call.save
        format.html { redirect_to collective_call_url(@collective_call), notice: "Collective call was successfully created." }
        format.json { render :show, status: :created, location: @collective_call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collective_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collective_calls/1 or /collective_calls/1.json
  def update
    respond_to do |format|
      if @collective_call.update(collective_call_params)
        format.html { redirect_to collective_call_url(@collective_call), notice: "Collective call was successfully updated." }
        format.json { render :show, status: :ok, location: @collective_call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collective_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collective_calls/1 or /collective_calls/1.json
  def destroy
    @collective_call.destroy

    respond_to do |format|
      format.html { redirect_to collective_calls_url, notice: "Collective call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collective_call
      @collective_call = CollectiveCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collective_call_params
      params.require(:collective_call).permit(:uuidFicha, :inep, :numParticipantes, :numAvaliacoesAlteradas, :atividadeTipo, :publicoAlvo, :tbCdsOrigem, :procedimento, :turno, :pseEducacao, :pseSaude, :temasParaSaude, :praticasEmSaude, :Participant_id, :Professional_id)
    end
end
