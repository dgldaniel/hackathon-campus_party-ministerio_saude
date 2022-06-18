# frozen_string_literal: true
class AddPhoneToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column(:patients, :phone, :string, limit: 10)
  end
end
