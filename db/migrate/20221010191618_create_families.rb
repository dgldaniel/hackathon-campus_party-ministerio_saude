# frozen_string_literal: true
class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table(:families) do |t|
      t.datetime(:dataNascimentoResponsavel)
      t.string(:numeroCnsResponsavel)
      t.integer(:numeroMembrosFamilia)
      t.string(:numeroProntuario)
      t.integer(:rendaFamiliar)
      t.datetime(:resideDesde)
      t.boolean(:stMudanca)
      t.references(:household_registration, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
