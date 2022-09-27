# frozen_string_literal: true
class IndividualRegistrationsController < ApplicationController
  before_action :set_individual_registration, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /individual_registrations or /individual_registrations.json
  def index
    @individual_registrations = IndividualRegistration.all
  end

  # GET /individual_registrations/1 or /individual_registrations/1.json
  def show
  end

  # GET /individual_registrations/new
  def new
    @individual_registration = IndividualRegistration.new

    @options = IndividualRegistration.build_options
  end

  # GET /individual_registrations/1/edit
  def edit
    @options = IndividualRegistration.build_options
  end

  # POST /individual_registrations or /individual_registrations.json
  def create
    @individual_registration = IndividualRegistration.new(individual_registration_params)
    @individual_registration.doctor = current_user.doctor

    respond_to do |format|
      if @individual_registration.save
        format.html { redirect_to(individual_registration_url(@individual_registration), notice: "Individual registration was successfully created.") }
        format.json { render(:show, status: :created, location: @individual_registration) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @individual_registration.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /individual_registrations/1 or /individual_registrations/1.json
  def update
    respond_to do |format|
      if @individual_registration.update(individual_registration_params)
        format.html { redirect_to(individual_registration_url(@individual_registration), notice: "Individual registration was successfully updated.") }
        format.json { render(:show, status: :ok, location: @individual_registration) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @individual_registration.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /individual_registrations/1 or /individual_registrations/1.json
  def destroy
    @individual_registration.destroy

    respond_to do |format|
      format.html { redirect_to(individual_registrations_url, notice: "Individual registration was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_individual_registration
      @individual_registration = IndividualRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def individual_registration_params
      params.require(:individual_registration).permit(:statusTemDoencaRespiratoria, :statusTemTeveDoencasRins, :statusTeveDoencaCardiaca, :statusTeveInternadoEm12Meses, :statusUsaPlantasMedicinais, :grauParentescoFamiliarFrequentado, :higienePessoalSituacaoRua, :origemAlimentoSituacaoRua, :outraInstituicaoQueAcompanha, :quantidadeAlimentacoesAoDiaSituacaoRua, :statusAcompanhadoPorOutraInstituicao, :statusTemAcessoHigienePessoalSituacaoRua, :statusVisitaFamiliarFrequentemente, :tempoSituacaoRua, :fichaAtualizada, :codigoIbgeMunicipioNascimento, :desconheceNomeMae, :statusEhResponsavel, :nomePaiCidadao, :desconheceNomePai, :microArea, :stForaArea, :deficienciasCidadao, :grauInstrucaoCidadao, :ocupacaoCodigoCbo2002, :statusFrequentaEscola, :statusMembroPovoComunidadeTradicional, :statusDesejaInformarIdentidadeGenero, :coPovoComunidadeTradicional, :statusTermoRecusaCadastroIndividualAtencaoBasica, :uuid, :uuidFichaOriginadora, :profissionalCNS, :cboCodigo_2002, :cnes, :ine, :dataAtendimento, :codigoIbgeMunicipio, :uuidDadoSerializado, :tipoDadoSerializado, :codIbge, :cnesDadoSerializado, :ineDadoSerializado, :numLote, :fichaAtualizada, :statusTermoRecusaCadastroIndividualAtencaoBasica, :tpCdsOrigem, :descricaoCausaInternacaoEm12Meses, :descricaoOutraCondicao1, :descricaoOutraCondicao2, :descricaoPlantasMedicinaisUsadas, :doencaCardiaca, :doencaRespiratoria, :doencaRins, :maternidadeDeReferencia, :situacaoPeso, :statusEhDependenteAlcool, :statusEhDependenteOutrasDrogas, :statusEhFumante, :statusEhGestante, :statusEstaAcamado, :statusEstaDomiciliado, :statusTemDiabetes, :statusTemDoencaRespiratoria, :statusTemHanseniase, :statusTemHipertensaoArterial, :statusTemTeveCancer, :statusTemTeveDoencasRins, :statusTemTuberculose, :statusTeveAvcDerrame, :statusTeveDoencaCardiaca, :statusTeveInfarto, :statusTeveInternadoEm12Meses, :statusUsaPlantasMedicinais, :statusDiagnosticoMental, :grauParentescoFamiliarFrequentado, :higienePessoalSituacaoRua, :higienePessoalSituacaoRua, :origemAlimentoSituacaoRua, :origemAlimentoSituacaoRua, :outraInstituicaoQueAcompanha, :quantidadeAlimentacoesAoDiaSituacaoRua, :statusAcompanhadoPorOutraInstituicao, :statusPossuiReferenciaFamiliar, :statusRecebeBeneficio, :statusSituacaoRua, :statusTemAcessoHigienePessoalSituacaoRua, :statusVisitaFamiliarFrequentemente, :tempoSituacaoRua, :codigoIbgeMunicipioNascimento, :dataNascimentoCidadao, :desconheceNomeMae, :emailCidadao, :nacionalidadeCidadao, :nomeCidadao, :nomeMaeCidadao, :cpfCidadao, :telefoneCelular, :paisNascimento, :racaCorCidadao, :sexoCidadao, :statusEhResponsavel, :etnia, :nomePaiCidadao, :desconheceNomePai, :microArea, :stForaArea, :deficienciasCidadao, :deficienciasCidadao, :ocupacaoCodigoCbo2002, :orientacaoSexualCidadao, :situacaoMercadoTrabalhoCidadao, :statusDesejaInformarOrientacaoSexual, :statusFrequentaBenzedeira, :statusFrequentaEscola, :statusMembroPovoComunidadeTradicional, :statusParticipaGrupoComunitario, :statusPossuiPlanoSaudePrivado, :statusTemAlgumaDeficiencia, :identidadeGeneroCidadao, :statusDesejaInformarIdentidadeGenero, :coPovoComunidadeTradicional)
    end
end
