require "application_system_test_case"

class IndividualRegistrationsTest < ApplicationSystemTestCase
  setup do
    @individual_registration = individual_registrations(:one)
  end

  test "visiting the index" do
    visit individual_registrations_url
    assert_selector "h1", text: "Individual Registrations"
  end

  test "creating a Individual registration" do
    visit individual_registrations_url
    click_on "New Individual Registration"

    fill_in "Cbocodigo 2002", with: @individual_registration.cboCodigo_2002
    fill_in "Cnes", with: @individual_registration.cnes
    fill_in "Cnesdadoserializado", with: @individual_registration.cnesDadoSerializado
    fill_in "Copovocomunidadetradicional", with: @individual_registration.coPovoComunidadeTradicional
    fill_in "Codibge", with: @individual_registration.codIbge
    fill_in "Codigoibgemunicipio", with: @individual_registration.codigoIbgeMunicipio
    fill_in "Codigoibgemunicipionascimento", with: @individual_registration.codigoIbgeMunicipioNascimento
    fill_in "Cpfcidadao", with: @individual_registration.cpfCidadao
    fill_in "Dataatendimento", with: @individual_registration.dataAtendimento
    fill_in "Datanascimentocidadao", with: @individual_registration.dataNascimentoCidadao
    fill_in "Deficienciascidadao", with: @individual_registration.deficienciasCidadao
    check "Desconhecenomemae" if @individual_registration.desconheceNomeMae
    check "Desconhecenomepai" if @individual_registration.desconheceNomePai
    fill_in "Descricaocausainternacaoem12meses", with: @individual_registration.descricaoCausaInternacaoEm12Meses
    fill_in "Descricaooutracondicao1", with: @individual_registration.descricaoOutraCondicao1
    fill_in "Descricaooutracondicao2", with: @individual_registration.descricaoOutraCondicao2
    fill_in "Descricaoplantasmedicinaisusadas", with: @individual_registration.descricaoPlantasMedicinaisUsadas
    fill_in "Doencacardiaca", with: @individual_registration.doencaCardiaca
    fill_in "Doencarespiratoria", with: @individual_registration.doencaRespiratoria
    fill_in "Doencarins", with: @individual_registration.doencaRins
    fill_in "Emailcidadao", with: @individual_registration.emailCidadao
    fill_in "Etnia", with: @individual_registration.etnia
    check "Fichaatualizada" if @individual_registration.fichaAtualizada
    fill_in "Grauinstrucaocidadao", with: @individual_registration.grauInstrucaoCidadao
    fill_in "Grauparentescofamiliarfrequentado", with: @individual_registration.grauParentescoFamiliarFrequentado
    fill_in "Higienepessoalsituacaorua", with: @individual_registration.higienePessoalSituacaoRua
    fill_in "Identidadegenerocidadao", with: @individual_registration.identidadeGeneroCidadao
    fill_in "Ine", with: @individual_registration.ine
    fill_in "Inedadoserializado", with: @individual_registration.ineDadoSerializado
    fill_in "Maternidadedereferencia", with: @individual_registration.maternidadeDeReferencia
    fill_in "Microarea", with: @individual_registration.microArea
    fill_in "Nacionalidadecidadao", with: @individual_registration.nacionalidadeCidadao
    fill_in "Nomecidadao", with: @individual_registration.nomeCidadao
    fill_in "Nomemaecidadao", with: @individual_registration.nomeMaeCidadao
    fill_in "Nomepaicidadao", with: @individual_registration.nomePaiCidadao
    fill_in "Numlote", with: @individual_registration.numLote
    fill_in "Ocupacaocodigocbo2002", with: @individual_registration.ocupacaoCodigoCbo2002
    fill_in "Orientacaosexualcidadao", with: @individual_registration.orientacaoSexualCidadao
    fill_in "Origemalimentosituacaorua", with: @individual_registration.origemAlimentoSituacaoRua
    fill_in "Outrainstituicaoqueacompanha", with: @individual_registration.outraInstituicaoQueAcompanha
    fill_in "Paisnascimento", with: @individual_registration.paisNascimento
    fill_in "Profissionalcns", with: @individual_registration.profissionalCNS
    fill_in "Quantidadealimentacoesaodiasituacaorua", with: @individual_registration.quantidadeAlimentacoesAoDiaSituacaoRua
    fill_in "Racacorcidadao", with: @individual_registration.racaCorCidadao
    fill_in "Sexocidadao", with: @individual_registration.sexoCidadao
    fill_in "Situacaomercadotrabalhocidadao", with: @individual_registration.situacaoMercadoTrabalhoCidadao
    fill_in "Situacaopeso", with: @individual_registration.situacaoPeso
    check "Stforaarea" if @individual_registration.stForaArea
    check "Statusacompanhadoporoutrainstituicao" if @individual_registration.statusAcompanhadoPorOutraInstituicao
    check "Statusdesejainformaridentidadegenero" if @individual_registration.statusDesejaInformarIdentidadeGenero
    check "Statusdesejainformarorientacaosexual" if @individual_registration.statusDesejaInformarOrientacaoSexual
    check "Statusdiagnosticomental" if @individual_registration.statusDiagnosticoMental
    check "Statusehdependentealcool" if @individual_registration.statusEhDependenteAlcool
    check "Statusehdependenteoutrasdrogas" if @individual_registration.statusEhDependenteOutrasDrogas
    check "Statusehfumante" if @individual_registration.statusEhFumante
    check "Statusehgestante" if @individual_registration.statusEhGestante
    check "Statusehresponsavel" if @individual_registration.statusEhResponsavel
    check "Statusestaacamado" if @individual_registration.statusEstaAcamado
    check "Statusestadomiciliado" if @individual_registration.statusEstaDomiciliado
    check "Statusfrequentabenzedeira" if @individual_registration.statusFrequentaBenzedeira
    check "Statusfrequentaescola" if @individual_registration.statusFrequentaEscola
    check "Statusmembropovocomunidadetradicional" if @individual_registration.statusMembroPovoComunidadeTradicional
    check "Statusparticipagrupocomunitario" if @individual_registration.statusParticipaGrupoComunitario
    check "Statuspossuiplanosaudeprivado" if @individual_registration.statusPossuiPlanoSaudePrivado
    check "Statuspossuireferenciafamiliar" if @individual_registration.statusPossuiReferenciaFamiliar
    check "Statusrecebebeneficio" if @individual_registration.statusRecebeBeneficio
    check "Statussituacaorua" if @individual_registration.statusSituacaoRua
    check "Statustemacessohigienepessoalsituacaorua" if @individual_registration.statusTemAcessoHigienePessoalSituacaoRua
    check "Statustemalgumadeficiencia" if @individual_registration.statusTemAlgumaDeficiencia
    check "Statustemdiabetes" if @individual_registration.statusTemDiabetes
    check "Statustemdoencarespiratoria" if @individual_registration.statusTemDoencaRespiratoria
    check "Statustemhanseniase" if @individual_registration.statusTemHanseniase
    check "Statustemhipertensaoarterial" if @individual_registration.statusTemHipertensaoArterial
    check "Statustemtevecancer" if @individual_registration.statusTemTeveCancer
    check "Statustemtevedoencasrins" if @individual_registration.statusTemTeveDoencasRins
    check "Statustemtuberculose" if @individual_registration.statusTemTuberculose
    check "Statustermorecusacadastroindividualatencaobasica" if @individual_registration.statusTermoRecusaCadastroIndividualAtencaoBasica
    check "Statusteveavcderrame" if @individual_registration.statusTeveAvcDerrame
    check "Statustevedoencacardiaca" if @individual_registration.statusTeveDoencaCardiaca
    check "Statusteveinfarto" if @individual_registration.statusTeveInfarto
    check "Statusteveinternadoem12meses" if @individual_registration.statusTeveInternadoEm12Meses
    check "statusUsaPlantasMedicinais" if @individual_registration.statusUsaPlantasMedicinais
    check "Statusvisitafamiliarfrequentemente" if @individual_registration.statusVisitaFamiliarFrequentemente
    fill_in "Telefonecelular", with: @individual_registration.telefoneCelular
    fill_in "Temposituacaorua", with: @individual_registration.tempoSituacaoRua
    fill_in "Tipodadoserializado", with: @individual_registration.tipoDadoSerializado
    fill_in "Tpcdsorigem", with: @individual_registration.tpCdsOrigem
    fill_in "Uuid", with: @individual_registration.uuid
    fill_in "Uuiddadoserializado", with: @individual_registration.uuidDadoSerializado
    fill_in "Uuidfichaoriginadora", with: @individual_registration.uuidFichaOriginadora
    click_on "Create Individual registration"

    assert_text "Individual registration was successfully created"
    click_on "Back"
  end

  test "updating a Individual registration" do
    visit individual_registrations_url
    click_on "Edit", match: :first

    fill_in "Cbocodigo 2002", with: @individual_registration.cboCodigo_2002
    fill_in "Cnes", with: @individual_registration.cnes
    fill_in "Cnesdadoserializado", with: @individual_registration.cnesDadoSerializado
    fill_in "Copovocomunidadetradicional", with: @individual_registration.coPovoComunidadeTradicional
    fill_in "Codibge", with: @individual_registration.codIbge
    fill_in "Codigoibgemunicipio", with: @individual_registration.codigoIbgeMunicipio
    fill_in "Codigoibgemunicipionascimento", with: @individual_registration.codigoIbgeMunicipioNascimento
    fill_in "Cpfcidadao", with: @individual_registration.cpfCidadao
    fill_in "Dataatendimento", with: @individual_registration.dataAtendimento
    fill_in "Datanascimentocidadao", with: @individual_registration.dataNascimentoCidadao
    fill_in "Deficienciascidadao", with: @individual_registration.deficienciasCidadao
    check "Desconhecenomemae" if @individual_registration.desconheceNomeMae
    check "Desconhecenomepai" if @individual_registration.desconheceNomePai
    fill_in "Descricaocausainternacaoem12meses", with: @individual_registration.descricaoCausaInternacaoEm12Meses
    fill_in "Descricaooutracondicao1", with: @individual_registration.descricaoOutraCondicao1
    fill_in "Descricaooutracondicao2", with: @individual_registration.descricaoOutraCondicao2
    fill_in "Descricaoplantasmedicinaisusadas", with: @individual_registration.descricaoPlantasMedicinaisUsadas
    fill_in "Doencacardiaca", with: @individual_registration.doencaCardiaca
    fill_in "Doencarespiratoria", with: @individual_registration.doencaRespiratoria
    fill_in "Doencarins", with: @individual_registration.doencaRins
    fill_in "Emailcidadao", with: @individual_registration.emailCidadao
    fill_in "Etnia", with: @individual_registration.etnia
    check "Fichaatualizada" if @individual_registration.fichaAtualizada
    fill_in "Grauinstrucaocidadao", with: @individual_registration.grauInstrucaoCidadao
    fill_in "Grauparentescofamiliarfrequentado", with: @individual_registration.grauParentescoFamiliarFrequentado
    fill_in "Higienepessoalsituacaorua", with: @individual_registration.higienePessoalSituacaoRua
    fill_in "Identidadegenerocidadao", with: @individual_registration.identidadeGeneroCidadao
    fill_in "Ine", with: @individual_registration.ine
    fill_in "Inedadoserializado", with: @individual_registration.ineDadoSerializado
    fill_in "Maternidadedereferencia", with: @individual_registration.maternidadeDeReferencia
    fill_in "Microarea", with: @individual_registration.microArea
    fill_in "Nacionalidadecidadao", with: @individual_registration.nacionalidadeCidadao
    fill_in "Nomecidadao", with: @individual_registration.nomeCidadao
    fill_in "Nomemaecidadao", with: @individual_registration.nomeMaeCidadao
    fill_in "Nomepaicidadao", with: @individual_registration.nomePaiCidadao
    fill_in "Numlote", with: @individual_registration.numLote
    fill_in "Ocupacaocodigocbo2002", with: @individual_registration.ocupacaoCodigoCbo2002
    fill_in "Orientacaosexualcidadao", with: @individual_registration.orientacaoSexualCidadao
    fill_in "Origemalimentosituacaorua", with: @individual_registration.origemAlimentoSituacaoRua
    fill_in "Outrainstituicaoqueacompanha", with: @individual_registration.outraInstituicaoQueAcompanha
    fill_in "Paisnascimento", with: @individual_registration.paisNascimento
    fill_in "Profissionalcns", with: @individual_registration.profissionalCNS
    fill_in "Quantidadealimentacoesaodiasituacaorua", with: @individual_registration.quantidadeAlimentacoesAoDiaSituacaoRua
    fill_in "Racacorcidadao", with: @individual_registration.racaCorCidadao
    fill_in "Sexocidadao", with: @individual_registration.sexoCidadao
    fill_in "Situacaomercadotrabalhocidadao", with: @individual_registration.situacaoMercadoTrabalhoCidadao
    fill_in "Situacaopeso", with: @individual_registration.situacaoPeso
    check "Stforaarea" if @individual_registration.stForaArea
    check "Statusacompanhadoporoutrainstituicao" if @individual_registration.statusAcompanhadoPorOutraInstituicao
    check "Statusdesejainformaridentidadegenero" if @individual_registration.statusDesejaInformarIdentidadeGenero
    check "Statusdesejainformarorientacaosexual" if @individual_registration.statusDesejaInformarOrientacaoSexual
    check "Statusdiagnosticomental" if @individual_registration.statusDiagnosticoMental
    check "Statusehdependentealcool" if @individual_registration.statusEhDependenteAlcool
    check "Statusehdependenteoutrasdrogas" if @individual_registration.statusEhDependenteOutrasDrogas
    check "Statusehfumante" if @individual_registration.statusEhFumante
    check "Statusehgestante" if @individual_registration.statusEhGestante
    check "Statusehresponsavel" if @individual_registration.statusEhResponsavel
    check "Statusestaacamado" if @individual_registration.statusEstaAcamado
    check "Statusestadomiciliado" if @individual_registration.statusEstaDomiciliado
    check "Statusfrequentabenzedeira" if @individual_registration.statusFrequentaBenzedeira
    check "Statusfrequentaescola" if @individual_registration.statusFrequentaEscola
    check "Statusmembropovocomunidadetradicional" if @individual_registration.statusMembroPovoComunidadeTradicional
    check "Statusparticipagrupocomunitario" if @individual_registration.statusParticipaGrupoComunitario
    check "Statuspossuiplanosaudeprivado" if @individual_registration.statusPossuiPlanoSaudePrivado
    check "Statuspossuireferenciafamiliar" if @individual_registration.statusPossuiReferenciaFamiliar
    check "Statusrecebebeneficio" if @individual_registration.statusRecebeBeneficio
    check "Statussituacaorua" if @individual_registration.statusSituacaoRua
    check "Statustemacessohigienepessoalsituacaorua" if @individual_registration.statusTemAcessoHigienePessoalSituacaoRua
    check "Statustemalgumadeficiencia" if @individual_registration.statusTemAlgumaDeficiencia
    check "Statustemdiabetes" if @individual_registration.statusTemDiabetes
    check "Statustemdoencarespiratoria" if @individual_registration.statusTemDoencaRespiratoria
    check "Statustemhanseniase" if @individual_registration.statusTemHanseniase
    check "Statustemhipertensaoarterial" if @individual_registration.statusTemHipertensaoArterial
    check "Statustemtevecancer" if @individual_registration.statusTemTeveCancer
    check "Statustemtevedoencasrins" if @individual_registration.statusTemTeveDoencasRins
    check "Statustemtuberculose" if @individual_registration.statusTemTuberculose
    check "Statustermorecusacadastroindividualatencaobasica" if @individual_registration.statusTermoRecusaCadastroIndividualAtencaoBasica
    check "Statusteveavcderrame" if @individual_registration.statusTeveAvcDerrame
    check "Statustevedoencacardiaca" if @individual_registration.statusTeveDoencaCardiaca
    check "Statusteveinfarto" if @individual_registration.statusTeveInfarto
    check "Statusteveinternadoem12meses" if @individual_registration.statusTeveInternadoEm12Meses
    check "statusUsaPlantasMedicinais" if @individual_registration.statusUsaPlantasMedicinais
    check "Statusvisitafamiliarfrequentemente" if @individual_registration.statusVisitaFamiliarFrequentemente
    fill_in "Telefonecelular", with: @individual_registration.telefoneCelular
    fill_in "Temposituacaorua", with: @individual_registration.tempoSituacaoRua
    fill_in "Tipodadoserializado", with: @individual_registration.tipoDadoSerializado
    fill_in "Tpcdsorigem", with: @individual_registration.tpCdsOrigem
    fill_in "Uuid", with: @individual_registration.uuid
    fill_in "Uuiddadoserializado", with: @individual_registration.uuidDadoSerializado
    fill_in "Uuidfichaoriginadora", with: @individual_registration.uuidFichaOriginadora
    click_on "Update Individual registration"

    assert_text "Individual registration was successfully updated"
    click_on "Back"
  end

  test "destroying a Individual registration" do
    visit individual_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Individual registration was successfully destroyed"
  end
end
