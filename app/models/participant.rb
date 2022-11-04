# frozen_string_literal: true
class Participant < ApplicationRecord
  belongs_to :collective_activity_sheet

  # validates_presence_of :cnsParticipante
end
