# frozen_string_literal: true
class Patient < ApplicationRecord
  enum gender_type: { male: 0, female: 1 }

  validates :email, presence: true
  validates :full_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :phone, presence: true

  belongs_to :doctor, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :report, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :report, allow_destroy: true
end
