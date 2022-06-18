# frozen_string_literal: true
class Address < ApplicationRecord
  validates :street, presence: true
  validates :state, presence: true
  validates :city, presence: true

  belongs_to :patient
end
