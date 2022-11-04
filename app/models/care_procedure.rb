# frozen_string_literal: true
class CareProcedure < ApplicationRecord
  belongs_to :procedure_sheet

  # validates_presence_of :dtNascimento
  # validates_presence_of :sexo
  # validates_presence_of :localAtendimento
end
