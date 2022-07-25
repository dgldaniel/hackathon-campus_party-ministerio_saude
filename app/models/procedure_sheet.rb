class ProcedureSheet < ApplicationRecord
  has_many :care_procedures, inverse_of: :procedure_sheet, dependent: :destroy
  accepts_nested_attributes_for :care_procedures, reject_if: :all_blank, allow_destroy: true
end
