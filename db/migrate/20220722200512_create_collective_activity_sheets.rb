class CreateCollectiveActivitySheets < ActiveRecord::Migration[6.1]
  def change
    create_table :collective_activity_sheets do |t|
      t.uuid :uuidFicha
      t.uuid :inep
      t.integer :numParticipantes
      t.integer :numAvaliacoesAlterada
      t.integer :atividadeTipo
      t.string :publicoAlvo, array: true, default: []
      t.references :participant, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true
      t.integer :tbCdsOrigem
      t.string :procedimento
      t.integer :turno
      t.boolean :pseEducacao
      t.boolean :pseSaude
      t.string :temasParaSaude, array: true, default: []
      t.string :praticasEmSaude, array: true, default: []

      t.timestamps
    end
  end
end
