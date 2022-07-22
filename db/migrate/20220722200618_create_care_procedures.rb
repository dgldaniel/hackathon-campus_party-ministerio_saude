class CreateCareProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :care_procedures do |t|
      t.string :numProntuario
      t.string :cnsCidadao
      t.string :dtNascimento
      t.integer :sexo
      t.integer :localAtendimento
      t.integer :turn
      t.boolean :statusEscutaInicialOrientacao
      t.string :procedimentos
      t.string :dataHoraInicialAtendimento
      t.string :dataHoraFinalAtendimento
      t.float :pesoAcompanhamentoNutricional
      t.float :alturaAcompanhamentoNutricional

      t.timestamps
    end
  end
end
