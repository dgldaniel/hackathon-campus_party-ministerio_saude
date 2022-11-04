# frozen_string_literal: true
class CreateHouseholdRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table(:household_registrations) do |t|
      t.integer(:animaisNoDomicilio, array: true, default: [])
      t.boolean(:fichaAtualizada)
      t.string(:quantosAnimaisNoDomicilio)
      t.boolean(:stAnimaisNoDomicilio)
      t.boolean(:statusTermoRecusaCadatroDomiciliarAtencaoBasica)
      t.integer(:tpCdsOrigem)
      t.uuid(:uuid)
      t.uuid(:uuidFichaOriginadora)
      t.string(:bairro)
      t.string(:cep)
      t.string(:codigoIbgeMunicipio)
      t.string(:complemento)
      t.string(:nomeLogradouro)
      t.string(:numero)
      t.string(:numeroDneUf)
      t.string(:telReferencial)
      t.string(:telResidencial)
      t.string(:tipoLogradouroNumeroDne)
      t.boolean(:stSemNumero)
      t.integer(:abastecimentoAgua)
      t.integer(:areaProducaoRural)
      t.integer(:destinoLixo)
      t.integer(:formaEscoamentoBanheiro)
      t.integer(:localizacao)
      t.integer(:materialPredominanteParedesExtDomicilio)
      t.string(:nuComodos)
      t.string(:nuMoradores)
      t.integer(:situacaoMoradiaPosseTerra)
      t.boolean(:stDiponibilidadeEnergiaeletrica)
      t.integer(:tipoAcessoDomicilio)
      t.integer(:tipoDomicilio)
      t.integer(:tratamentoAguaDomicilio)

      t.references(:doctor, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
