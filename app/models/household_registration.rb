# frozen_string_literal: true
class HouseholdRegistration < ApplicationRecord
  has_many :families, inverse_of: :household_registration, dependent: :destroy
  accepts_nested_attributes_for :families, reject_if: :all_blank, allow_destroy: true
end
