# frozen_string_literal: true
class Doctor < ApplicationRecord
  belongs_to :user

  has_many :patients

  has_many :individual_registrations
  has_many :individual_calls
  has_many :household_registrations
  has_many :procedure_sheets
  has_many :collective_activity_sheets

  has_one_attached :procedure_sheet_xml_files
  has_one_attached :collective_activity_sheet_xml_files
  has_one_attached :individual_call_xml_files
  has_one_attached :individual_registrations_xml_files
  has_one_attached :avatar

  def self.build_options
    {
      municipios: JSON.parse(Rails.cache.read('@CI_Municipio')),
      cbo: JSON.parse(Rails.cache.read('@CI_CBO')),
    }
  end
end
