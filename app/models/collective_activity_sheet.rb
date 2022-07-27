class CollectiveActivitySheet < ApplicationRecord
  has_many :participants, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  has_many :professionals, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :professionals, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
end
