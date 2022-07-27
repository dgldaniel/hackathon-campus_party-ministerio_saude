class CreateExamResults < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_results do |t|
      t.string :exame
      t.datetime :dataSolicitacao
      t.datetime :dataRealizacao
      t.datetime :dataResultado
      t.integer :tipoResultado
      t.integer :valorResultado

      t.timestamps
    end
  end
end
