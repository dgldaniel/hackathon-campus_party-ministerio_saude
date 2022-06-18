# frozen_string_literal: true
class AddZipCodeToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column(:addresses, :zip_code, :string, limit: 15)
  end
end
