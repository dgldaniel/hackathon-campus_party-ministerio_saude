require "application_system_test_case"

class HouseholdRegistrationsTest < ApplicationSystemTestCase
  setup do
    @household_registration = household_registrations(:one)
  end

  test "visiting the index" do
    visit household_registrations_url
    assert_selector "h1", text: "Household Registrations"
  end

  test "creating a Household registration" do
    visit household_registrations_url
    click_on "New Household Registration"

    fill_in "Abastecimentoagua", with: @household_registration.abastecimentoAgua
    fill_in "Animaisnodomicilio", with: @household_registration.animaisNoDomicilio
    fill_in "Areaproducaorural", with: @household_registration.areaProducaoRural
    fill_in "Bairro", with: @household_registration.bairro
    fill_in "Cep", with: @household_registration.cep
    fill_in "Codigoibgemunicipio", with: @household_registration.codigoIbgeMunicipio
    fill_in "Complemento", with: @household_registration.complemento
    fill_in "Destinolixo", with: @household_registration.destinoLixo
    check "Fichaatualizada" if @household_registration.fichaAtualizada
    fill_in "Formaescoamentobanheiro", with: @household_registration.formaEscoamentoBanheiro
    fill_in "Localizacao", with: @household_registration.localizacao
    fill_in "Materialpredominanteparedesextdomicilio", with: @household_registration.materialPredominanteParedesExtDomicilio
    fill_in "Nomelogradouro", with: @household_registration.nomeLogradouro
    fill_in "Nucomodos", with: @household_registration.nuComodos
    fill_in "Numoradores", with: @household_registration.nuMoradores
    fill_in "Numero", with: @household_registration.numero
    fill_in "Numerodneuf", with: @household_registration.numeroDneUf
    fill_in "Quantosanimaisnodomicilio", with: @household_registration.quantosAnimaisNoDomicilio
    fill_in "Situacaomoradiaposseterra", with: @household_registration.situacaoMoradiaPosseTerra
    check "Stanimaisnodomicilio" if @household_registration.stAnimaisNoDomicilio
    check "Stdiponibilidadeenergiaeletrica" if @household_registration.stDiponibilidadeEnergiaeletrica
    check "Stsemnumero" if @household_registration.stSemNumero
    fill_in "Statustermorecusacadatrodomiciliaratencaobasica", with: @household_registration.statusTermoRecusaCadatroDomiciliarAtencaoBasica
    fill_in "Telreferencial", with: @household_registration.telReferencial
    fill_in "Telresidencial", with: @household_registration.telResidencial
    fill_in "Tipoacessodomicilio", with: @household_registration.tipoAcessoDomicilio
    fill_in "Tipodomicilio", with: @household_registration.tipoDomicilio
    fill_in "Tipologradouronumerodne", with: @household_registration.tipoLogradouroNumeroDne
    fill_in "Tpcdsorigem", with: @household_registration.tpCdsOrigem
    fill_in "Tratamentoaguadomicilio", with: @household_registration.tratamentoAguaDomicilio
    fill_in "Uuid", with: @household_registration.uuid
    fill_in "Uuidfichaoriginadora", with: @household_registration.uuidFichaOriginadora
    click_on "Create Household registration"

    assert_text "Household registration was successfully created"
    click_on "Back"
  end

  test "updating a Household registration" do
    visit household_registrations_url
    click_on "Edit", match: :first

    fill_in "Abastecimentoagua", with: @household_registration.abastecimentoAgua
    fill_in "Animaisnodomicilio", with: @household_registration.animaisNoDomicilio
    fill_in "Areaproducaorural", with: @household_registration.areaProducaoRural
    fill_in "Bairro", with: @household_registration.bairro
    fill_in "Cep", with: @household_registration.cep
    fill_in "Codigoibgemunicipio", with: @household_registration.codigoIbgeMunicipio
    fill_in "Complemento", with: @household_registration.complemento
    fill_in "Destinolixo", with: @household_registration.destinoLixo
    check "Fichaatualizada" if @household_registration.fichaAtualizada
    fill_in "Formaescoamentobanheiro", with: @household_registration.formaEscoamentoBanheiro
    fill_in "Localizacao", with: @household_registration.localizacao
    fill_in "Materialpredominanteparedesextdomicilio", with: @household_registration.materialPredominanteParedesExtDomicilio
    fill_in "Nomelogradouro", with: @household_registration.nomeLogradouro
    fill_in "Nucomodos", with: @household_registration.nuComodos
    fill_in "Numoradores", with: @household_registration.nuMoradores
    fill_in "Numero", with: @household_registration.numero
    fill_in "Numerodneuf", with: @household_registration.numeroDneUf
    fill_in "Quantosanimaisnodomicilio", with: @household_registration.quantosAnimaisNoDomicilio
    fill_in "Situacaomoradiaposseterra", with: @household_registration.situacaoMoradiaPosseTerra
    check "Stanimaisnodomicilio" if @household_registration.stAnimaisNoDomicilio
    check "Stdiponibilidadeenergiaeletrica" if @household_registration.stDiponibilidadeEnergiaeletrica
    check "Stsemnumero" if @household_registration.stSemNumero
    fill_in "Statustermorecusacadatrodomiciliaratencaobasica", with: @household_registration.statusTermoRecusaCadatroDomiciliarAtencaoBasica
    fill_in "Telreferencial", with: @household_registration.telReferencial
    fill_in "Telresidencial", with: @household_registration.telResidencial
    fill_in "Tipoacessodomicilio", with: @household_registration.tipoAcessoDomicilio
    fill_in "Tipodomicilio", with: @household_registration.tipoDomicilio
    fill_in "Tipologradouronumerodne", with: @household_registration.tipoLogradouroNumeroDne
    fill_in "Tpcdsorigem", with: @household_registration.tpCdsOrigem
    fill_in "Tratamentoaguadomicilio", with: @household_registration.tratamentoAguaDomicilio
    fill_in "Uuid", with: @household_registration.uuid
    fill_in "Uuidfichaoriginadora", with: @household_registration.uuidFichaOriginadora
    click_on "Update Household registration"

    assert_text "Household registration was successfully updated"
    click_on "Back"
  end

  test "destroying a Household registration" do
    visit household_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Household registration was successfully destroyed"
  end
end
