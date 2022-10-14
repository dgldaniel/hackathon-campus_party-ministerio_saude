# frozen_string_literal: true
class HouseholdRegistrationsController < ApplicationController
  before_action :set_household_registration, only: %i[show edit update destroy]

  # GET /household_registrations or /household_registrations.json
  def index
    @household_registrations = current_user.doctor.household_registrations
  end

  # GET /household_registrations/1 or /household_registrations/1.json
  def show
  end

  # GET /household_registrations/new
  def new
    @household_registration = HouseholdRegistration.new
    @household_registration.families.build

    @options = HouseholdRegistration.build_options
  end

  # GET /household_registrations/1/edit
  def edit
    @options = HouseholdRegistration.build_options
  end

  # POST /household_registrations or /household_registrations.json
  def create
    @household_registration = HouseholdRegistration.new(household_registration_params)
    @household_registration.doctor = current_user.doctor

    respond_to do |format|
      if @household_registration.save
        format.html { redirect_to(household_registration_url(@household_registration), notice: "Household registration was successfully created.") }
        format.json { render(:show, status: :created, location: @household_registration) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @household_registration.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /household_registrations/1 or /household_registrations/1.json
  def update
    respond_to do |format|
      if @household_registration.update(household_registration_params)
        format.html { redirect_to(household_registration_url(@household_registration), notice: "Household registration was successfully updated.") }
        format.json { render(:show, status: :ok, location: @household_registration) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @household_registration.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /household_registrations/1 or /household_registrations/1.json
  def destroy
    @household_registration.destroy

    respond_to do |format|
      format.html { redirect_to(household_registrations_url, notice: "Household registration was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_household_registration
      @household_registration = HouseholdRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def household_registration_params
      params.require(:household_registration)
            .permit(:animaisNoDomicilio,
                    :fichaAtualizada,
                    :quantosAnimaisNoDomicilio,
                    :stAnimaisNoDomicilio,
                    :statusTermoRecusaCadatroDomiciliarAtencaoBasica,
                    :tpCdsOrigem,
                    :uuid,
                    :uuidFichaOriginadora,
                    :bairro,
                    :cep,
                    :codigoIbgeMunicipio,
                    :complemento,
                    :nomeLogradouro,
                    :numero,
                    :numeroDneUf,
                    :telReferencial,
                    :telResidencial,
                    :tipoLogradouroNumeroDne,
                    :stSemNumero,
                    :abastecimentoAgua,
                    :areaProducaoRural,
                    :destinoLixo,
                    :formaEscoamentoBanheiro,
                    :localizacao,
                    :materialPredominanteParedesExtDomicilio,
                    :nuComodos,
                    :nuMoradores,
                    :situacaoMoradiaPosseTerra,
                    :stDiponibilidadeEnergiaeletrica,
                    :tipoAcessoDomicilio,
                    :tipoDomicilio,
                    :tratamentoAguaDomicilio,
                    families_attributes: [
                      :id,
                      :dataNascimentoResponsavel,
                      :numeroCnsResponsavel,
                      :numeroMembrosFamilia,
                      :numeroProntuario,
                      :rendaFamiliar,
                      :resideDesde,
                      :stMudanca,
                      :_destroy,
                    ])
    end
end
