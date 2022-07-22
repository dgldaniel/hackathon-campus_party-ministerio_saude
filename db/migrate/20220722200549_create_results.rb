class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :tipoResultado
      t.string :valorResultado

      t.timestamps
    end
  end
end
