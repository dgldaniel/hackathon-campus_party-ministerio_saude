class CreateCollectiveCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :collective_calls do |t|
      t.uuid :uuidFicha
      t.string :inep
      t.integer :numParticipantes
      t.integer :numAvaliacoesAlteradas
      t.integer :atividadeTipo
      t.string :publicoAlvo, array: true, default: []
      t.integer :tbCdsOrigem
      t.string :procedimento
      t.integer :turno
      t.boolean :pseEducacao
      t.boolean :pseSaude
      t.string :temasParaSaude, array: true, default: []
      t.string :praticasEmSaude, array: true, default: []
      t.references :participants, null: false, foreign_key: true
      t.references :professionals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
