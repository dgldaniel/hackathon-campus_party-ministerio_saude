class CreateIndividualRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_registrations do |t|
      t.boolean :statusTemDoencaRespiratoria, null: true
      t.boolean :statusUsaOutrasPraticasIntegrativasOuComplementares, null: true
      t.boolean :statusTemTeveDoencasRins, null: true
      t.boolean :statusTeveDoencaCardiaca, null: true
      t.boolean :statusTeveInternadoEm12Meses, null: true
      t.boolean :statusUsaPlantaMedicinais, null: true
      t.string :grauParentescoFamiliarFrequentado, null: true, limit: 100
      t.string :nomeSocial, null: true, limit: 70
      t.integer :higienePessoalSituacaoRua, array: true, default: []
      t.integer :origemAlimentoSituacaoRua, array: true, default: []
      t.string :outraInstituicaoQueAcompanha, null: true, limit: 100
      t.integer :quantidadeAlimentacoesAoDiaSituacaoRua, null: true
      t.boolean :statusAcompanhadoPorOutraInstituicao, null: true
      t.boolean :statusTemAcessoHigienePessoalSituacaoRua, null: true
      t.boolean :statusVisitaFamiliarFrequentemente, null: true
      t.integer :tempoSituacaoRua, null: true
      t.string :codigoIbgeMunicipioNascimento, null: true, 'char(7)'
      t.boolean :desconheceNomeMae, null: true
      t.boolean :statusEhResponsavel, null: true
      t.string :nomePaiCidadao, null: true, limit: 70
      t.boolean :desconheceNomePai, null: true
      t.date :dtNaturalizacao, null: true
      t.date :dtEntradaBrasil, null: true
      t.string :microArea, null: true, 'char(2)'
      t.boolean :stForaArea, null: true
      t.integer :deficienciasCidadao, array: true, default: []
      t.integer :responsavelPorCrianca, array: true, default: []
      t.integer :grauInstrucaoCidadao, null: true
      t.string :ocupacaoCodigoCbo2002, null: true
      t.string :portariaNaturalizacao, null: true, limit: 16
      t.boolean :statusFrequentaEscola, null: true
      t.boolean :statusMembroPovoComunidadeTradicional, null: true
      t.boolean :statusDesejaInformarIdentidadeGenero, null: true
      t.integer :coPovoComunidadeTradicional, null: true
      t.boolean :statusTermoRecusaCadastroIndividualAtencaoBasica, null: true
      t.uuid :uuid
      t.uuid :uuidFichaOriginadora, null: true
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
      t.boolean :motivoSaidaCidadao, null: true
      t.integer :tpCdsOrigem, null: false
      t.string :descricaoCausaInternacaoEm12Meses, null: true, limit: 100
      t.string :descricaoOutraCondicao1, null: true, limit: 100
      t.string :descricaoOutraCondicao2, null: true, limit: 100
      t.string :descricaoOutraCondicao3, null: true, limit: 100
      t.string :descricaoPlantasMedicinaisUsadas, null: true, limit: 100
      t.integer :doencaCardiaca, array: true, default: []
      t.integer :doencaRespiratoria, array: true, default: []
      t.integer :doencaRins, array: true, default: []
      t.string :maternidadeDeReferencia, null: true, limit: 100
      t.integer :situacaoPeso, null: true
      t.boolean :statusEhDependenteAlcool, null: true
      t.boolean :statusEhDependenteOutrasDrogas, null: true
      t.boolean :statusEhFumante, null: true
      t.boolean :statusEhGestante, null: true
      t.boolean :statusEstaAcamado, null: true
      t.boolean :statusEstaDomiciliado, null: true
      t.boolean :statusTemDiabetes, null: true
      t.boolean :statusTemHanseniase, null: true
      t.boolean :statusTemHipertensaoArterial, null: true
      t.boolean :statusTemTeveCancer, null: true
      t.boolean :statusTemTuberculose, null: true
      t.boolean :statusTeveAvcDerrame, null: true
      t.boolean :statusTeveInfarto, null: true
      t.boolean :statusDiagnosticoMental, null: true
      t.boolean :statusPossuiReferenciaFamiliar, null: true
      t.boolean :statusRecebeBeneficio, null: true
      t.boolean :statusSituacaoRua, null: true
      t.date :dataNascimentoCidadao, null: false
      t.string :emailCidadao, null: true, limit: 100
      t.integer :nacionalidadeCidadao, null: false
      t.string :nomeCidadao, null: false, limit: 70
      t.string :nomeMaeCidadao, null: true, limit: 70
      t.string :cpfCidadao, null: true, 'char(11)'
      t.string :cpfResponsavelFamiliar, null: true, 'char(11)'
      t.string :cnsCidadao, null: true, 'char(15)'
      t.string :cnsResponsavelFamiliar, null: true, 'char(15)'
      t.string :telefoneCelular, null: true, limit: 11
      t.string :numeroNisPisPasep, null: true, 'char(11)'
      t.integer :paisNascimento, null: true
      t.integer :racaCorCidadao, null: false
      t.integer :sexoCidadao, null: false
      t.integer :etnia, null: true
      t.integer :orientacaoSexualCidadao, null: true
      t.integer :relacaoParentescoCidadao, null: true
      t.integer :situacaoMercadoTrabalhoCidadao, null: true
      t.boolean :statusDesejaInformarOrientacaoSexual, null: true
      t.boolean :statusFrequentaBenzedeira, null: true
      t.boolean :statusParticipaGrupoComunitario, null: true
      t.boolean :statusPossuiPlanoSaudePrivado, null: true
      t.boolean :statusTemAlgumaDeficiencia, null: true
      t.integer :identidadeGeneroCidadao, null: true
      t.date :dataObito, null: true
      t.string :numeroDO, null: true, 'char(9)'
      t.boolean :statusCadastroIndividualInativo, null: true
      t.boolean :statusGeradoAutomaticamente, null: true

      t.timestamps
    end
  end
end
