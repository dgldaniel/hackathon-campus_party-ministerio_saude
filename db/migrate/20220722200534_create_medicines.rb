class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :codigoCatmat
      t.integer :viaAdministracao
      t.string :dose
      t.boolean :doseUnica
      t.boolean :usoContinuo
      t.integer :doseFrequenciaTipo
      t.string :doseFrequencia
      t.integer :doseFrequenciaQuantidade
      t.integer :doseFrequenciaUnidadeMedida
      t.string :dtInicioTratamento
      t.integer :duracaoTratamento
      t.integer :duracaoTratamentoMedida
      t.integer :quantidadeReceitada

      t.timestamps
    end
  end
end
