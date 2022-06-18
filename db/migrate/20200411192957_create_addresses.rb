# frozen_string_literal: true
class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table(:addresses) do |t|
      t.string(:street, limit: 50)
      t.integer(:number)
      t.string(:state, limit: 50)
      t.string(:city, limit: 50)
      t.string(:complement, limit: 50)

      t.timestamps
    end
  end
end
