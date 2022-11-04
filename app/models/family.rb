# frozen_string_literal: true
class Family < ApplicationRecord
  belongs_to :household_registration

  # validates_presence_of :dataNascimentoResponsavel
#   validates_presence_of :numeroCnsResponsavel
#   validates_presence_of :numeroMembrosFamilia
#   validates_presence_of :numeroProntuario
#   validates_presence_of :rendaFamiliar
#   validates_presence_of :resideDesde
#   validates_presence_of :stMudanca

#   validates_presence_of :dataNascimentoResponsavel,
#                         :numeroCnsResponsavel,
#                         :numeroMembrosFamilia,
#                         :numeroProntuario,
#                         :rendaFamiliar,
#                         :resideDesde,
#                         :stMudanca
end
