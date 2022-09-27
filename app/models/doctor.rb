# frozen_string_literal: true
class Doctor < ApplicationRecord
  belongs_to :user
  has_many :patients

  # has_many :individual_registrations

  has_one_attached :procedure_sheet_xml_files
  has_one_attached :collective_activity_sheet_xml_files
  has_one_attached :individual_call_xml_files
  has_one_attached :individual_registrations_xml_files
end
