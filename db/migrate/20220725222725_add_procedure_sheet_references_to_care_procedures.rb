class AddProcedureSheetReferencesToCareProcedures < ActiveRecord::Migration[6.1]
  def change
    add_reference(:care_procedures, :procedure_sheet, index: true)
  end
end
