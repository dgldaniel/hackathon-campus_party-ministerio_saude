# frozen_string_literal: true
class AddProcedimentoToCareProcedures < ActiveRecord::Migration[6.1]
  def change
    add_column(:care_procedures, :outrosSiaProcedimentos, :string)
  end
end
