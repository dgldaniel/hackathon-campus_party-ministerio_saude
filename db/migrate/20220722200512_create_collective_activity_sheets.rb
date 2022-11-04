# frozen_string_literal: true
class CreateCollectiveActivitySheets < ActiveRecord::Migration[6.1]
  def change
    create_table(:collective_activity_sheets) do |t|
      t.uuid(:uuidFicha)
      t.datetime(:dtAtividadeColetiva)
      t.integer(:numParticipantesProgramados)
      t.string(:cnesLocalAtividade)
      t.time(:horaInicio)
      t.time(:horaFim)
      t.integer(:inep)
      t.string(:responsavelCns)
      t.string(:responsavelCnesUnidade)
      t.integer(:responsavelNumIne)
      t.integer(:numParticipantes)
      t.integer(:numAvaliacoesAlteradas)
      t.integer(:atividadeTipo)
      t.integer(:temasParaReuniao, array: true, default: [])
      t.integer(:publicoAlvo, array: true, default: [])
      t.integer(:praticasTemasParaSaude, array: true, default: [])
      t.integer(:tbCdsOrigem)
      t.string(:codigoIbgeMunicipio, null: true)

      t.references(:doctor, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
