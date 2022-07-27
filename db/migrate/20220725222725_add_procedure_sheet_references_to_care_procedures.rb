class AddProcedureSheetReferencesToCareProcedures < ActiveRecord::Migration[6.1]
  def change
    add_reference(:care_procedures, :procedure_sheet, index: true)
    add_reference(:problem_condition_evaluateds, :individual_call, index: true)
    add_reference(:exams, :individual_call, index: true)
    add_reference(:exam_results, :individual_call, index: true)
    add_reference(:medicines, :individual_call, index: true)
    add_reference(:forwardings, :individual_call, index: true)
    add_reference(:participants, :collective_activity_sheet, index: true)
    add_reference(:professionals, :collective_activity_sheet, index: true)
  end
end
