# frozen_string_literal: true
class CreateCareProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table(:care_procedures) do |t|
      t.string(:numProntuario)
      t.string(:cnsCidadao)
      t.datetime(:dtNascimento)
      t.integer(:sexo)
      t.integer(:localAtendimento)
      t.integer(:turn)
      t.boolean(:statusEscutaInicialOrientacao)
      t.string(:procedimentos, array: true, default: [])
      t.datetime(:dataHoraInicialAtendimento)
      t.datetime(:dataHoraFinalAtendimento)
      t.float(:pesoAcompanhamentoNutricional)
      t.float(:alturaAcompanhamentoNutricional)

      t.timestamps
    end
  end
end
