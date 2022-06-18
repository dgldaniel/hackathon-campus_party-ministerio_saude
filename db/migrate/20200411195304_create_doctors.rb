# frozen_string_literal: true
class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table(:doctors) do |t|
      t.string(:full_name, limit: 50)
      t.string(:CRM, limit: 15)

      t.timestamps
    end
  end
end
