# frozen_string_literal: true
class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table(:doctors) do |t|
      t.string(:name, null: false)
      t.boolean(:checked_exists, default: false)
      t.string(:profissionalCNS, limit: 15, null: false)
      t.string(:cboCodigo_2002, null: false)
      t.string(:cnes, limit: 7, null: false)
      t.string(:ine, limit: 10, null: true)
      t.datetime(:dataAtendimento, null: false)
      t.string(:codigoIbgeMunicipio, limit: 15, null: false)

      t.timestamps
    end
  end
end
