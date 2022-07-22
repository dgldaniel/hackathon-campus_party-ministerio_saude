class CreateProcedureSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :procedure_sheets do |t|
      t.uuid :uuidFicha
      t.integer :tpCdsOrigem
      t.integer :numTotalAfericaoPa
      t.integer :numTotalAfericaoTemperatura
      t.integer :numTotalCurativoSimples
      t.integer :numTotalColetaMaterialParaExameLaboratorial
      t.integer :numTotalGlicemiaCapilar
      t.integer :numTotalMedicaoAltura
      t.integer :numTotalMedicaoPeso

      t.timestamps
    end
  end
end
