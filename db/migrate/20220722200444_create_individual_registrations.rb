class CreateIndividualRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_registrations do |t|
      t.boolean :statusTemDoencaRespiratoria
      t.boolean :statusTemTeveDoencasRins
      t.boolean :statusTeveDoencaCardiaca
      t.boolean :statusTeveInternadoEm12Meses
      t.boolean :statusUsaPlantaMedicinais
      t.string :grauParentescoFamiliarFrequentado
      t.string :higienePessoalSituacaoRua, array: true, default: []
      t.string :origemAlimentoSituacaoRua, array: true, default: []
      t.string :outraInstituicaoQueAcompanha
      t.integer :quantidadeAlimentacoesAoDiaSituacaoRua
      t.boolean :statusAcompanhadoPorOutraInstituicao
      t.boolean :statusTemAcessoHigienePessoalSituacaoRua
      t.boolean :statusVisitaFamiliarFrequentemente
      t.integer :tempoSituacaoRua
      t.string :codigoIbgeMunicipioNascimento
      t.boolean :desconheceNomeMae
      t.boolean :statusEhResponsavel
      t.string :nomePaiCidadao
      t.boolean :desconheceNomePai
      t.string :microArea
      t.boolean :stForaArea
      t.string :deficienciasCidadao, array: true, default: []
      t.integer :grauInstrucaoCidadao
      t.string :ocupacaoCodigoCbo2002
      t.boolean :statusFrequentaEscola
      t.boolean :statusMembroPovoComunidadeTradicional
      t.boolean :statusDesejaInformarIdentidadeGenero
      t.integer :coPovoComunidadeTradicional
      t.boolean :statusTermoRecusaCadastroIndividualAtencaoBasica
      t.uuid :uuid
      t.uuid :uuidFichaOriginadora
      t.string :profissionalCNS
      t.string :cboCodigo_2002
      t.string :cnes
      t.string :ine
      t.datetime :dataAtendimento
      t.string :codigoIbgeMunicipio
      t.uuid :uuidDadoSerializado
      t.integer :tipoDadoSerializado
      t.string :codIbge
      t.string :cnesDadoSerializado
      t.string :ineDadoSerializado
      t.integer :numLote
      t.boolean :fichaAtualizada
      t.integer :tpCdsOrigem
      t.string :descricaoCausaInternacaoEm12Meses
      t.string :descricaoOutraCondicao1
      t.string :descricaoOutraCondicao2
      t.string :descricaoPlantasMedicinaisUsadas
      t.integer :doencaCardiaca
      t.integer :doencaRespiratoria
      t.integer :doencaRins
      t.string :maternidadeDeReferencia
      t.integer :situacaoPeso
      t.boolean :statusEhDependenteAlcool
      t.boolean :statusEhDependenteOutrasDrogas
      t.boolean :statusEhFumante
      t.boolean :statusEhGestante
      t.boolean :statusEstaAcamado
      t.boolean :statusEstaDomiciliado
      t.boolean :statusTemDiabetes
      t.boolean :statusTemHanseniase
      t.boolean :statusTemHipertensaoArterial
      t.boolean :statusTemTeveCancer
      t.boolean :statusTemTuberculose
      t.boolean :statusTeveAvcDerrame
      t.boolean :statusTeveInfarto
      t.boolean :statusDiagnosticoMental
      t.boolean :statusPossuiReferenciaFamiliar
      t.boolean :statusRecebeBeneficio
      t.boolean :statusSituacaoRua
      t.string :dataNascimentoCidadao
      t.string :emailCidadao
      t.integer :nacionalidadeCidadao
      t.string :nomeCidadao
      t.string :nomeMaeCidadao
      t.string :cpfCidadao
      t.string :telefoneCelular
      t.string :paisNascimento
      t.integer :racaCorCidadao
      t.integer :sexoCidadao
      t.integer :etnia
      t.integer :orientacaoSexualCidadao
      t.integer :situacaoMercadoTrabalhoCidadao
      t.boolean :statusDesejaInformarOrientacaoSexual
      t.boolean :statusFrequentaBenzedeira
      t.boolean :statusParticipaGrupoComunitario
      t.boolean :statusPossuiPlanoSaudePrivado
      t.boolean :statusTemAlgumaDeficiencia

      t.timestamps
    end
  end
end
