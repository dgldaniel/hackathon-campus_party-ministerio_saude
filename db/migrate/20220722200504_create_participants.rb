# frozen_string_literal: true
class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table(:participants) do |t|
      t.string(:cnsParticipante)
      t.datetime(:dataNascimento)
      t.boolean(:avaliacaoAlterada)
      t.boolean(:cessouHabitoFumar)
      t.boolean(:abandonouGrupo)

      t.timestamps
    end
  end
end
