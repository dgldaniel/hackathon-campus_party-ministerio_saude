# frozen_string_literal: true
class IndividualCall < ApplicationRecord
  belongs_to :doctor

  has_one :problem_condition_evaluated, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :problem_condition_evaluated, reject_if: :all_blank, allow_destroy: true

  has_many :exams, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :exams, reject_if: :all_blank, allow_destroy: true

  has_many :exam_results, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :exam_results, reject_if: :all_blank, allow_destroy: true

  has_many :medicines, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :medicines, reject_if: :all_blank, allow_destroy: true

  has_many :forwardings, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :forwardings, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
  has_one_attached :thrift_file

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'individual_calls/show.xml.erb',
      :locals => { :@individual_call => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{numeroProntuario}.xml"
    )
  end

  def self.build_options
    {
      aleitamento_materno: JSON.parse(Rails.cache.read('@FAI_Aleitamento_Materno')),
      conduta_encaminhamento: JSON.parse(Rails.cache.read('@FAI_Conduta_Encaminhamento')),
      lista_ciap: JSON.parse(Rails.cache.read('@FAI_Lista_CIAP')),
      lista_exame_solicitado: JSON.parse(Rails.cache.read('@FAI_Lista_Exame_Solicitado')),
      local_atendimento: JSON.parse(Rails.cache.read('@FAI_Local_Atendimento')),
      modalidade_ad: JSON.parse(Rails.cache.read('@FAI_Modalidade_AD')),
      nasf: JSON.parse(Rails.cache.read('@FAI_NASF')),
      praticas_integrativas_complementares: JSON.parse(Rails.cache.read('@FAI_Praticas_Integrativas_Complementares')),
      situacao_exame: JSON.parse(Rails.cache.read('@FAI_Situacao_Exame')),
      tipo_atendimento: JSON.parse(Rails.cache.read('@FAI_Tipo_Atendimento')),
      turno: JSON.parse(Rails.cache.read('@FAI_Turno')),
      sexo: JSON.parse(Rails.cache.read('@CI_Sexo')),
      pic: JSON.parse(Rails.cache.read('@FAI_PIC')),
    }
  end
end
