# frozen_string_literal: true
class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table(:exams) do |t|
      t.string(:codigoExame)
      t.string(:solicitadoAvaliado, array: true, default: [])

      t.timestamps
    end
  end
end
