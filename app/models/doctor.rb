# frozen_string_literal: true
class Doctor < ApplicationRecord
  belongs_to :user
  has_many :patients

  validates :full_name, presence: true
end
