require "test_helper"

class HouseholdRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @household_registration = household_registrations(:one)
  end

  test "should get index" do
    get household_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_household_registration_url
    assert_response :success
  end

  test "should create household_registration" do
    assert_difference('HouseholdRegistration.count') do
      post household_registrations_url, params: { household_registration: { abastecimentoAgua: @household_registration.abastecimentoAgua, animaisNoDomicilio: @household_registration.animaisNoDomicilio, areaProducaoRural: @household_registration.areaProducaoRural, bairro: @household_registration.bairro, cep: @household_registration.cep, codigoIbgeMunicipio: @household_registration.codigoIbgeMunicipio, complemento: @household_registration.complemento, destinoLixo: @household_registration.destinoLixo, fichaAtualizada: @household_registration.fichaAtualizada, formaEscoamentoBanheiro: @household_registration.formaEscoamentoBanheiro, localizacao: @household_registration.localizacao, materialPredominanteParedesExtDomicilio: @household_registration.materialPredominanteParedesExtDomicilio, nomeLogradouro: @household_registration.nomeLogradouro, nuComodos: @household_registration.nuComodos, nuMoradores: @household_registration.nuMoradores, numero: @household_registration.numero, numeroDneUf: @household_registration.numeroDneUf, quantosAnimaisNoDomicilio: @household_registration.quantosAnimaisNoDomicilio, situacaoMoradiaPosseTerra: @household_registration.situacaoMoradiaPosseTerra, stAnimaisNoDomicilio: @household_registration.stAnimaisNoDomicilio, stDiponibilidadeEnergiaeletrica: @household_registration.stDiponibilidadeEnergiaeletrica, stSemNumero: @household_registration.stSemNumero, statusTermoRecusaCadatroDomiciliarAtencaoBasica: @household_registration.statusTermoRecusaCadatroDomiciliarAtencaoBasica, telReferencial: @household_registration.telReferencial, telResidencial: @household_registration.telResidencial, tipoAcessoDomicilio: @household_registration.tipoAcessoDomicilio, tipoDomicilio: @household_registration.tipoDomicilio, tipoLogradouroNumeroDne: @household_registration.tipoLogradouroNumeroDne, tpCdsOrigem: @household_registration.tpCdsOrigem, tratamentoAguaDomicilio: @household_registration.tratamentoAguaDomicilio, uuid: @household_registration.uuid, uuidFichaOriginadora: @household_registration.uuidFichaOriginadora } }
    end

    assert_redirected_to household_registration_url(HouseholdRegistration.last)
  end

  test "should show household_registration" do
    get household_registration_url(@household_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_household_registration_url(@household_registration)
    assert_response :success
  end

  test "should update household_registration" do
    patch household_registration_url(@household_registration), params: { household_registration: { abastecimentoAgua: @household_registration.abastecimentoAgua, animaisNoDomicilio: @household_registration.animaisNoDomicilio, areaProducaoRural: @household_registration.areaProducaoRural, bairro: @household_registration.bairro, cep: @household_registration.cep, codigoIbgeMunicipio: @household_registration.codigoIbgeMunicipio, complemento: @household_registration.complemento, destinoLixo: @household_registration.destinoLixo, fichaAtualizada: @household_registration.fichaAtualizada, formaEscoamentoBanheiro: @household_registration.formaEscoamentoBanheiro, localizacao: @household_registration.localizacao, materialPredominanteParedesExtDomicilio: @household_registration.materialPredominanteParedesExtDomicilio, nomeLogradouro: @household_registration.nomeLogradouro, nuComodos: @household_registration.nuComodos, nuMoradores: @household_registration.nuMoradores, numero: @household_registration.numero, numeroDneUf: @household_registration.numeroDneUf, quantosAnimaisNoDomicilio: @household_registration.quantosAnimaisNoDomicilio, situacaoMoradiaPosseTerra: @household_registration.situacaoMoradiaPosseTerra, stAnimaisNoDomicilio: @household_registration.stAnimaisNoDomicilio, stDiponibilidadeEnergiaeletrica: @household_registration.stDiponibilidadeEnergiaeletrica, stSemNumero: @household_registration.stSemNumero, statusTermoRecusaCadatroDomiciliarAtencaoBasica: @household_registration.statusTermoRecusaCadatroDomiciliarAtencaoBasica, telReferencial: @household_registration.telReferencial, telResidencial: @household_registration.telResidencial, tipoAcessoDomicilio: @household_registration.tipoAcessoDomicilio, tipoDomicilio: @household_registration.tipoDomicilio, tipoLogradouroNumeroDne: @household_registration.tipoLogradouroNumeroDne, tpCdsOrigem: @household_registration.tpCdsOrigem, tratamentoAguaDomicilio: @household_registration.tratamentoAguaDomicilio, uuid: @household_registration.uuid, uuidFichaOriginadora: @household_registration.uuidFichaOriginadora } }
    assert_redirected_to household_registration_url(@household_registration)
  end

  test "should destroy household_registration" do
    assert_difference('HouseholdRegistration.count', -1) do
      delete household_registration_url(@household_registration)
    end

    assert_redirected_to household_registrations_url
  end
end
