# frozen_string_literal: true
# municipios, cbo e comunidade
class IndividualRegistration < ApplicationRecord
  has_one_attached :xml_file

  # validates :cpfCidadao, uniqueness: true
  # validates :cnsCidadao, uniqueness: true

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def self.generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'individual_registrations/show.xml.erb',
      :locals => { :@individual_registration => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{id}.xml"
    )
  end

  def self.build_options
    {
      municipios: JSON.parse(Rails.cache.read('@CI_Municipio')),
      nacionalidade: JSON.parse(Rails.cache.read('@CI_Nacionalidade')),
      pais: JSON.parse(Rails.cache.read('@CI_Pais')),
      raca_cor: JSON.parse(Rails.cache.read('@CI_Raca_Cor')),
      sexo: JSON.parse(Rails.cache.read('@CI_Sexo')),
      doenca_cardiaca: JSON.parse(Rails.cache.read('@CI_Doenca_Cardiaca')),
      doenca_respiratoria: JSON.parse(Rails.cache.read('@CI_Doenca_Respiratoria')),
      problema_rins: JSON.parse(Rails.cache.read('@CI_Problema_Rins')),
      situacao_peso: JSON.parse(Rails.cache.read('@CI_Situacao_Peso')),
      acesso_higiene: JSON.parse(Rails.cache.read('@CI_Acesso_Higiene')),
      origem_alimento: JSON.parse(Rails.cache.read('@CI_Origem_Alimento')),
      quantas_vezes_alimentacao: JSON.parse(Rails.cache.read('@CI_Quantas_Vezes_Alimentacao')),
      tempo_situacao_rua: JSON.parse(Rails.cache.read('@CI_Tempo_Situacao_Rua')),
      deficiencia_cidadao: JSON.parse(Rails.cache.read('@CI_Deficiencia_Cidadao')),
      curso_mais_elevado: JSON.parse(Rails.cache.read('@CI_Curso_Mais_Elevado')),
      motivo_saida: JSON.parse(Rails.cache.read('@CI_Motivo_Saida')),
      cbo: JSON.parse(Rails.cache.read('@CI_CBO')),
      orientacao_sexual: JSON.parse(Rails.cache.read('@CI_Orientacao_Sexual')),
      relacao_parentesco: JSON.parse(Rails.cache.read('@CI_Relacao_Parentesco')),
      responsavel_crianca: JSON.parse(Rails.cache.read('@CI_Responsavel_Crianca')),
      situacao_mercado_trabalho: JSON.parse(Rails.cache.read('@CI_Situacao_Mercado')),
    }
  end

  # private_class_method :build_options
  # private_class_method :generate_xml
end
