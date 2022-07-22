class CreateIndividualCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_calls do |t|
      t.string :numeroProntuario
      t.string :cnsCidadao
      t.datetime :dataNascimento
      t.integer :localDeAtendimento
      t.integer :sexo
      t.integer :turno
      t.integer :tipoAtendimento
      t.float :pesoAcompanhamentoNutricional
      t.float :alturaAcompanhamentoNutricional
      t.integer :aleitamentoMaterno
      t.datetime :dumDaGestante
      t.integer :idadeGestacional
      t.integer :atencaoDomiciliarModalidade
      t.boolean :vacinaEmDia
      t.boolean :ficouEmObservacao
      t.integer :nasfs
      t.string :condutas, array: true, default: []
      t.boolean :stGravidezPlanejada
      t.integer :nuGestasPrevias
      t.integer :nuPartos
      t.integer :racionalidadeSaude
      t.float :perimetroCefalico
      t.datetime :dataHoraInicialAtendimento
      t.datetime :dataHoraFinalAtendimento
      t.references :exam_results, null: false, foreign_key: true
      t.references :professionals, null: false, foreign_key: true
      t.references :participants, null: false, foreign_key: true
      t.references :collective_activity_sheets, null: false, foreign_key: true
      t.references :exams, null: false, foreign_key: true
      t.references :medicines, null: false, foreign_key: true
      t.references :forwardings, null: false, foreign_key: true

      t.timestamps
    end
  end
end
