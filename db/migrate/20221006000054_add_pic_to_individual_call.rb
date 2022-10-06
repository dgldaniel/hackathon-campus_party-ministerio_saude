# frozen_string_literal: true
class AddPicToIndividualCall < ActiveRecord::Migration[6.1]
  def change
    add_column(:individual_calls, :pic, :string)
    add_column(:individual_calls, :examesSolicitados, :string, array: true, default: [])
    add_column(:individual_calls, :examesAvaliados, :string, array: true, default: [])
  end
end
