# frozen_string_literal: true
class CreateIndividualCallMasters < ActiveRecord::Migration[6.1]
  def change
    create_table(:individual_call_masters) do |t|
      t.integer(:tpCdsOrigem)
      t.uuid(:uuid)

      t.references(:doctor, null: false, foreign_key: true)

      t.timestamps
    end

    add_reference(:individual_calls, :individual_call_master, index: true)
  end
end
