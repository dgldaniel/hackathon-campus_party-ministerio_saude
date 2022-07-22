class CreateForwardings < ActiveRecord::Migration[6.1]
  def change
    create_table :forwardings do |t|
      t.integer :especialidade
      t.string :hipoteseDiagnosticoCid10
      t.integer :classificacaoRisco

      t.timestamps
    end
  end
end
