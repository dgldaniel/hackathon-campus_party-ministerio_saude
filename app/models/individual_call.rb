class IndividualCall < ApplicationRecord
  has_one :problem_condition_evaluated, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :problem_condition_evaluated, reject_if: :all_blank, allow_destroy: true

  has_many :exams, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :exams, reject_if: :all_blank, allow_destroy: true

  has_many :exam_results, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :exam_results, reject_if: :all_blank, allow_destroy: true

  has_many :medicines, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :medicines, reject_if: :all_blank, allow_destroy: true

  has_many :forwardings, inverse_of: :individual_call, dependent: :destroy
  accepts_nested_attributes_for :forwardings, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
end
