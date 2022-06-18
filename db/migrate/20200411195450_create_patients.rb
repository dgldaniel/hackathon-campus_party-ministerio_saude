# frozen_string_literal: true
class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table(:patients) do |t|
      t.string(:email, limit: 50)
      t.string(:full_name, limit: 50)
      t.integer(:age)

      t.references(:doctor, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
