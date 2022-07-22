class ForwardingsController < ApplicationController
  before_action :set_forwarding, only: %i[ show edit update destroy ]

  # GET /forwardings or /forwardings.json
  def index
    @forwardings = Forwarding.all
  end

  # GET /forwardings/1 or /forwardings/1.json
  def show
  end

  # GET /forwardings/new
  def new
    @forwarding = Forwarding.new
  end

  # GET /forwardings/1/edit
  def edit
  end

  # POST /forwardings or /forwardings.json
  def create
    @forwarding = Forwarding.new(forwarding_params)

    respond_to do |format|
      if @forwarding.save
        format.html { redirect_to forwarding_url(@forwarding), notice: "Forwarding was successfully created." }
        format.json { render :show, status: :created, location: @forwarding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forwarding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forwardings/1 or /forwardings/1.json
  def update
    respond_to do |format|
      if @forwarding.update(forwarding_params)
        format.html { redirect_to forwarding_url(@forwarding), notice: "Forwarding was successfully updated." }
        format.json { render :show, status: :ok, location: @forwarding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forwarding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forwardings/1 or /forwardings/1.json
  def destroy
    @forwarding.destroy

    respond_to do |format|
      format.html { redirect_to forwardings_url, notice: "Forwarding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forwarding
      @forwarding = Forwarding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forwarding_params
      params.require(:forwarding).permit(:especialidade, :hipoteseDiagnosticoCid10, :classificacaoRisco)
    end
end
