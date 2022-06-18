class AddMoreInfoToIndividualRegistration < ActiveRecord::Migration[6.1]
  def change
    add_column(:individual_registrations, :dor_pernas, :string)
    add_column(:individual_registrations, :hem_glicada, :float)
    add_column(:individual_registrations, :dentista_semestre, :string)
    add_column(:individual_registrations, :vacinou_h1n1, :string)
    add_column(:individual_registrations, :vacinou_covid, :string)
    add_column(:individual_registrations, :consulta_cardiologista_ano, :string)
    add_column(:individual_registrations, :classica_auto_cuidado, :string)
    add_column(:individual_registrations, :entende_importancia_alimentacao_diabetes, :string)
    add_column(:individual_registrations, :consegue_alimentacao_saudavel, :string)
    add_column(:individual_registrations, :consultou_psicologo, :string)
    add_column(:individual_registrations, :altura, :string)
    add_column(:individual_registrations, :imc, :string)
    add_column(:individual_registrations, :peadesao_medicamento, :string)
    add_column(:individual_registrations, :autismo_leve, :string)
  end
end
