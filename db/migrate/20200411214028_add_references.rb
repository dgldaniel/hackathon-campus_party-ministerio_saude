# frozen_string_literal: true
class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference(:addresses, :patient, index: true)
    add_reference(:reports, :patient, index: true)
    add_reference(:doctors, :user, index: true)
  end
end
