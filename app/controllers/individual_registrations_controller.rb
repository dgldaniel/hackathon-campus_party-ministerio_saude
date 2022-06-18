class IndividualRegistrationsController < ApplicationController
  before_action :set_individual_registration, only: %i[ show edit update destroy ]

  # GET /individual_registrations or /individual_registrations.json
  def index
    @q = IndividualRegistration.ransack params[:q]
    @individual_registrations =  @q.result(distinct: true).page(params[:page])
  end

  # GET /individual_registrations/1 or /individual_registrations/1.json
  def show
  end

  # GET /individual_registrations/new
  def new
    @individual_registration = IndividualRegistration.new
  end

  # GET /individual_registrations/1/edit
  def edit
  end

  # POST /individual_registrations or /individual_registrations.json
  def create
    @individual_registration = IndividualRegistration.new(individual_registration_params)

    respond_to do |format|
      if @individual_registration.save
        format.html { redirect_to individual_registration_url(@individual_registration), notice: "Individual registration was successfully created." }
        format.json { render :show, status: :created, location: @individual_registration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @individual_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_registrations/1 or /individual_registrations/1.json
  def update
    respond_to do |format|
      if @individual_registration.update(individual_registration_params)
        format.html { redirect_to individual_registration_url(@individual_registration), notice: "Individual registration was successfully updated." }
        format.json { render :show, status: :ok, location: @individual_registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @individual_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_registrations/1 or /individual_registrations/1.json
  def destroy
    @individual_registration.destroy

    respond_to do |format|
      format.html { redirect_to individual_registrations_url, notice: "Individual registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def notify_patient
    respond_to do |format|
      format.js {
        NotifyPatientJob.perform_later individual_registration_notify_patient_params
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_registration
      @individual_registration = IndividualRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def individual_registration_params
      params.require(:individual_registration).permit(:cns_cpf_cidadao, :cns_cpf_responsavel_familiar, :nome_completo, :data_nascimento, :sexo, :raca_cor, :etnia, :pis_pasep, :nome_completo_mae, :nome_completo_pai, :nacionalidade, :pais_nascimento, :data_naturalizacao, :municipio_uf_nascimento, :telefone_celular, :email, :relacao_parentesco_responsavel_familiar, :curso_elevado_frequenta_frequentou, :situacao_mercado_trabalho, :frequenta_cuidador_tradicional, :participa_grupo_comunitario, :possui_plano_saude_privado, :orientacao_sexual, :identidade_genero, :saida_cidadao_cadastro, :gestante, :peso, :fumante, :uso_alcool, :uso_outras_drogas, :hipertensao_arterial, :diabetes, :avc_derrame, :infarto, :hanseniase, :tuberculose, :tem_ou_teve_cancer, :alguma_internacao_ultimos_12_meses, :diagnostico_algum_problema_saude_mental_profissional_saude, :acamado, :domiciliado, :outras_praticas_integrativas_complementares, :situacao_rua, :recebe_algum_beneficio, :possui_referencia_familiar)
    end

    def individual_registration_notify_patient_params
      params.permit(:id, :title, :nome_completo, :description)
    end
end
