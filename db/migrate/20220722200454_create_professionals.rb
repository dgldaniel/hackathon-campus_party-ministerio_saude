class CreateProfessionals < ActiveRecord::Migration[6.1]
  def change
    create_table :professionals do |t|
      t.string :cnsProfissional
      t.string :codigoCbo2002

      t.timestamps
    end
  end
end
