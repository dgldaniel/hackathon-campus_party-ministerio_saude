class GenerateXmlIndividualRegistrationsJob < ApplicationJob
  require "rexml/document"

  queue_as :default

  def perform(individual_registration)
    doc = REXML::Document.new
    decl = REXML::XMLDecl.new("1.0","UTF-8")

    doc.add decl

    ns3 = REXML::Element.new("ns3:dadoTransporteTransportXml")
    ns3.add_attribute 'xmlns:ns2', "http://esus.ufsc.br/dadoinstalacao"
    ns3.add_attribute 'xmlns:ns3', "http://esus.ufsc.br/dadotransporte"
    ns3.add_attribute 'xmlns:ns4', "http://esus.ufsc.br/cadastroindividual"

    uuidDadoSerializado = REXML::Element.new("uuidDadoSerializado")
    uuidDadoSerializado.text = '0019615-ced61f6f-0f37-48df-b894-1d1c729f8ad7'
    ns3.add_element uuidDadoSerializado

    tipoDadoSerializado = REXML::Element.new("tipoDadoSerializado")
    tipoDadoSerializado.text = 2
    ns3.add_element tipoDadoSerializado

    codIbge = REXML::Element.new("codIbge")
    codIbge.text = 4205407
    ns3.add_element codIbge

    cnesDadoSerializado = REXML::Element.new("cnesDadoSerializado")
    cnesDadoSerializado.text = '0019615'
    ns3.add_element cnesDadoSerializado

    ineDadoSerializado = REXML::Element.new("ineDadoSerializadol")
    ineDadoSerializado.text = '0000471828'
    ns3.add_element ineDadoSerializado

    numLote = REXML::Element.new("numLote")
    numLote.text = 7
    ns3.add_element numLote

    ns4 = REXML::Element.new("ns4:cadastroIndividualTransport")
    condicoesDeSaude = REXML::Element.new("condicoesDeSaude")

    descricaoCausaInternacaoEm12Meses = REXML::Element.new("descricaoCausaInternacaoEm12Meses")
    descricaoCausaInternacaoEm12Meses.text = 'gripe'
    condicoesDeSaude.add_element descricaoCausaInternacaoEm12Meses

    descricaoOutraCondicao1 = REXML::Element.new("descricaoOutraCondicao1")
    descricaoOutraCondicao1.text = "alérgico"
    condicoesDeSaude.add_element descricaoOutraCondicao1

    descricaoOutraCondicao2 = REXML::Element.new("descricaoOutraCondicao2")
    descricaoOutraCondicao2.text = "intolerante a lactose"
    condicoesDeSaude.add_element descricaoOutraCondicao2

    descricaoPlantasMedicinaisUsadas = REXML::Element.new("descricaoPlantasMedicinaisUsadas")
    descricaoPlantasMedicinaisUsadas.text = "macela e boldo"
    condicoesDeSaude.add_element descricaoPlantasMedicinaisUsadas

    doencaCardiaca = REXML::Element.new("doencaCardiacao")
    doencaCardiaca.text = 26
    condicoesDeSaude.add_element doencaCardiaca

    doencaRespiratoria = REXML::Element.new("doencaRespiratoria")
    doencaRespiratoria.text = 30
    condicoesDeSaude.add_element doencaRespiratoria

    doencaRins = REXML::Element.new("doencaRins")
    doencaRins.text = 27
    condicoesDeSaude.add_element doencaRins

    maternidadeDeReferencia = REXML::Element.new("maternidadeDeReferencia")
    maternidadeDeReferencia.text = "maternidade"
    condicoesDeSaude.add_element maternidadeDeReferencia

    situacaoPeso = REXML::Element.new("situacaoPeso")
    situacaoPeso.text = 22
    condicoesDeSaude.add_element situacaoPeso

    statusEhDependenteAlcool = REXML::Element.new("statusEhDependenteAlcool")
    statusEhDependenteAlcool.text = false
    condicoesDeSaude.add_element statusEhDependenteAlcool

    statusEhDependenteOutrasDrogas = REXML::Element.new("statusEhDependenteOutrasDrogas")
    statusEhDependenteOutrasDrogas.text = false
    condicoesDeSaude.add_element statusEhDependenteOutrasDrogas

    statusEhFumante = REXML::Element.new("statusEhFumante")
    statusEhFumante.text = false
    condicoesDeSaude.add_element statusEhFumante

    statusEhGestante = REXML::Element.new("statusEhGestante")
    statusEhGestante.text = false
    condicoesDeSaude.add_element statusEhGestante

    statusEstaAcamado = REXML::Element.new("statusEstaAcamado")
    statusEstaAcamado.text = false
    condicoesDeSaude.add_element statusEstaAcamado

    statusEstaDomiciliado = REXML::Element.new("statusEstaDomiciliado")
    statusEstaDomiciliado.text = false
    condicoesDeSaude.add_element statusEstaDomiciliado

    statusTemDiabetes = REXML::Element.new("statusTemDiabetes")
    statusTemDiabetes.text = false
    condicoesDeSaude.add_element statusTemDiabetes

    statusTemDoencaRespiratoria = REXML::Element.new("statusTemDoencaRespiratoria")
    statusTemDoencaRespiratoria.text = false
    condicoesDeSaude.add_element statusTemDoencaRespiratoria

    statusTemHanseniase = REXML::Element.new("statusTemHanseniase")
    statusTemHanseniase.text = false
    condicoesDeSaude.add_element statusTemHanseniase

    statusTemHipertensaoArterial = REXML::Element.new("statusTemHipertensaoArterial")
    statusTemHipertensaoArterial.text = false
    condicoesDeSaude.add_element statusTemHipertensaoArterial

    statusTemTeveCancer = REXML::Element.new("statusTemTeveCancer")
    statusTemTeveCancer.text = false
    condicoesDeSaude.add_element statusTemTeveCancer

    statusTemTeveDoencasRins = REXML::Element.new("statusTemTeveDoencasRins")
    statusTemTeveDoencasRins.text = false
    condicoesDeSaude.add_element statusTemTeveDoencasRins

    statusTemTuberculose = REXML::Element.new("statusTemTuberculose")
    statusTemTuberculose.text = false
    condicoesDeSaude.add_element statusTemTuberculose

    statusTeveAvcDerrame = REXML::Element.new("statusTeveAvcDerrame")
    statusTeveAvcDerrame.text = false
    condicoesDeSaude.add_element statusTeveAvcDerrame

    statusTeveDoencaCardiaca = REXML::Element.new("statusTeveDoencaCardiaca")
    statusTeveDoencaCardiaca.text = false
    condicoesDeSaude.add_element statusTeveDoencaCardiaca

    statusTeveInfarto = REXML::Element.new("statusTeveInfarto")
    statusTeveInfarto.text = false
    condicoesDeSaude.add_element statusTeveInfarto

    statusTeveInternadoEm12Meses = REXML::Element.new("statusTeveInternadoEm12Meses")
    statusTeveInternadoEm12Meses.text = false
    condicoesDeSaude.add_element statusTeveInternadoEm12Meses

    statusUsaPlantaMedicinais = REXML::Element.new("statusUsaPlantaMedicinais")
    statusUsaPlantaMedicinais.text = false
    condicoesDeSaude.add_element statusUsaPlantaMedicinais

    statusDiagnosticoMental = REXML::Element.new("statusDiagnosticoMental")
    statusDiagnosticoMental.text = false
    condicoesDeSaude.add_element statusDiagnosticoMental

    emSituacaoDeRua = REXML::Element.new("emSituacaoDeRua")

    grauParentescoFamiliarFrequentado = REXML::Element.new("grauParentescoFamiliarFrequentado")
    grauParentescoFamiliarFrequentado.text = false
    emSituacaoDeRua.add_element grauParentescoFamiliarFrequentado

    higienePessoalSituacaoRua = REXML::Element.new("higienePessoalSituacaoRua")
    higienePessoalSituacaoRua.text = false
    emSituacaoDeRua.add_element higienePessoalSituacaoRua

    higienePessoalSituacaoRua = REXML::Element.new("higienePessoalSituacaoRua")
    higienePessoalSituacaoRua.text = false
    emSituacaoDeRua.add_element higienePessoalSituacaoRua

    origemAlimentoSituacaoRua = REXML::Element.new("origemAlimentoSituacaoRua")
    origemAlimentoSituacaoRua.text = false
    emSituacaoDeRua.add_element origemAlimentoSituacaoRua

    origemAlimentoSituacaoRua = REXML::Element.new("origemAlimentoSituacaoRua")
    origemAlimentoSituacaoRua.text = false
    emSituacaoDeRua.add_element origemAlimentoSituacaoRua

    outraInstituicaoQueAcompanha = REXML::Element.new("outraInstituicaoQueAcompanha")
    outraInstituicaoQueAcompanha.text = false
    emSituacaoDeRua.add_element outraInstituicaoQueAcompanha

    quantidadeAlimentacoesAoDiaSituacaoRua = REXML::Element.new("quantidadeAlimentacoesAoDiaSituacaoRua")
    quantidadeAlimentacoesAoDiaSituacaoRua.text = false
    emSituacaoDeRua.add_element quantidadeAlimentacoesAoDiaSituacaoRua

    statusAcompanhadoPorOutraInstituicao = REXML::Element.new("statusAcompanhadoPorOutraInstituicao")
    statusAcompanhadoPorOutraInstituicao.text = false
    emSituacaoDeRua.add_element statusAcompanhadoPorOutraInstituicao

    statusPossuiReferenciaFamiliar = REXML::Element.new("statusPossuiReferenciaFamiliar")
    statusPossuiReferenciaFamiliar.text = false
    emSituacaoDeRua.add_element statusPossuiReferenciaFamiliar

    statusRecebeBeneficio = REXML::Element.new("statusRecebeBeneficio")
    statusRecebeBeneficio.text = false
    emSituacaoDeRua.add_element statusRecebeBeneficio

    statusSituacaoRua = REXML::Element.new("statusSituacaoRua")
    statusSituacaoRua.text = false
    emSituacaoDeRua.add_element statusSituacaoRua

    statusTemAcessoHigienePessoalSituacaoRua = REXML::Element.new("statusTemAcessoHigienePessoalSituacaoRua")
    statusTemAcessoHigienePessoalSituacaoRua.text = false
    emSituacaoDeRua.add_element statusTemAcessoHigienePessoalSituacaoRua

    statusVisitaFamiliarFrequentemente = REXML::Element.new("statusVisitaFamiliarFrequentemente")
    statusVisitaFamiliarFrequentemente.text = false
    emSituacaoDeRua.add_element statusVisitaFamiliarFrequentemente

    tempoSituacaoRua = REXML::Element.new("tempoSituacaoRua")
    tempoSituacaoRua.text = false
    emSituacaoDeRua.add_element tempoSituacaoRua

    fichaAtualizada = REXML::Element.new("fichaAtualizada")
    fichaAtualizada.text = false

    identificacaoUsuarioCidadao = REXML::Element.new("identificacaoUsuarioCidadao")

    codigoIbgeMunicipioNascimento = REXML::Element.new("codigoIbgeMunicipioNascimento")
    codigoIbgeMunicipioNascimento.text = false
    identificacaoUsuarioCidadao.add_element codigoIbgeMunicipioNascimento

    dataNascimentoCidadao = REXML::Element.new("dataNascimentoCidadao")
    dataNascimentoCidadao.text = false
    identificacaoUsuarioCidadao.add_element dataNascimentoCidadao

    desconheceNomeMae = REXML::Element.new("desconheceNomeMae")
    desconheceNomeMae.text = false
    identificacaoUsuarioCidadao.add_element desconheceNomeMae

    emailCidadao = REXML::Element.new("emailCidadao")
    emailCidadao.text = false
    identificacaoUsuarioCidadao.add_element emailCidadao

    nacionalidadeCidadao = REXML::Element.new("nacionalidadeCidadao")
    nacionalidadeCidadao.text = false
    identificacaoUsuarioCidadao.add_element nacionalidadeCidadao

    nomeCidadao = REXML::Element.new("nomeCidadao")
    nomeCidadao.text = false
    identificacaoUsuarioCidadao.add_element nomeCidadao

    nomeMaeCidadao = REXML::Element.new("nomeMaeCidadao")
    nomeMaeCidadao.text = false
    identificacaoUsuarioCidadao.add_element nomeMaeCidadao

    cpfCidadao = REXML::Element.new("cpfCidadao")
    cpfCidadao.text = false
    identificacaoUsuarioCidadao.add_element cpfCidadao

    telefoneCelular = REXML::Element.new("telefoneCelular")
    telefoneCelular.text = false
    identificacaoUsuarioCidadao.add_element telefoneCelular

    paisNascimento = REXML::Element.new("paisNascimento")
    paisNascimento.text = false
    identificacaoUsuarioCidadao.add_element paisNascimento

    racaCorCidadao = REXML::Element.new("racaCorCidadao")
    racaCorCidadao.text = false
    identificacaoUsuarioCidadao.add_element racaCorCidadao

    sexoCidadao = REXML::Element.new("sexoCidadao")
    sexoCidadao.text = false
    identificacaoUsuarioCidadao.add_element sexoCidadao

    statusEhResponsavel = REXML::Element.new("statusEhResponsavel")
    statusEhResponsavel.text = false
    identificacaoUsuarioCidadao.add_element statusEhResponsavel

    etnia = REXML::Element.new("etnia")
    etnia.text = false
    identificacaoUsuarioCidadao.add_element etnia

    nomePaiCidadao = REXML::Element.new("nomePaiCidadao")
    nomePaiCidadao.text = false
    identificacaoUsuarioCidadao.add_element nomePaiCidadao

    nomePaiCidadao = REXML::Element.new("nomePaiCidadao")
    nomePaiCidadao.text = false
    identificacaoUsuarioCidadao.add_element nomePaiCidadao

    nomePaiCidadao = REXML::Element.new("nomePaiCidadao")
    nomePaiCidadao.text = false
    identificacaoUsuarioCidadao.add_element nomePaiCidadao

    desconheceNomePai = REXML::Element.new("desconheceNomePai")
    desconheceNomePai.text = false
    identificacaoUsuarioCidadao.add_element desconheceNomePai

    microArea = REXML::Element.new("microArea")
    microArea.text = false
    identificacaoUsuarioCidadao.add_element microArea

    stForaArea = REXML::Element.new("stForaArea")
    stForaArea.text = false
    identificacaoUsuarioCidadao.add_element stForaArea

    informacoesSocioDemograficas = REXML::Element.new("informacoesSocioDemograficas")

    deficienciasCidadao = REXML::Element.new("deficienciasCidadao")
    deficienciasCidadao.text = false
    informacoesSocioDemograficas.add_element deficienciasCidadao

    deficienciasCidadao = REXML::Element.new("deficienciasCidadao")
    deficienciasCidadao.text = false
    informacoesSocioDemograficas.add_element deficienciasCidadao

    grauInstrucaoCidadao = REXML::Element.new("grauInstrucaoCidadao")
    grauInstrucaoCidadao.text = false
    informacoesSocioDemograficas.add_element grauInstrucaoCidadao

    ocupacaoCodigoCbo2002 = REXML::Element.new("ocupacaoCodigoCbo2002")
    ocupacaoCodigoCbo2002.text = false
    informacoesSocioDemograficas.add_element ocupacaoCodigoCbo2002

    orientacaoSexualCidadao = REXML::Element.new("orientacaoSexualCidadao")
    orientacaoSexualCidadao.text = false
    informacoesSocioDemograficas.add_element orientacaoSexualCidadao

    situacaoMercadoTrabalhoCidadao = REXML::Element.new("situacaoMercadoTrabalhoCidadao")
    situacaoMercadoTrabalhoCidadao.text = false
    informacoesSocioDemograficas.add_element situacaoMercadoTrabalhoCidadao

    statusFrequentaBenzedeira = REXML::Element.new("statusFrequentaBenzedeira")
    statusFrequentaBenzedeira.text = false
    informacoesSocioDemograficas.add_element statusFrequentaBenzedeira

    statusFrequentaEscola = REXML::Element.new("statusFrequentaEscola")
    statusFrequentaEscola.text = false
    informacoesSocioDemograficas.add_element statusFrequentaEscola

    situacaoMercadoTrabalhoCidadao = REXML::Element.new("situacaoMercadoTrabalhoCidadao")
    situacaoMercadoTrabalhoCidadao.text = false
    informacoesSocioDemograficas.add_element situacaoMercadoTrabalhoCidadao

    statusMembroPovoComunidadeTradicional = REXML::Element.new("statusMembroPovoComunidadeTradicional")
    statusMembroPovoComunidadeTradicional.text = false
    informacoesSocioDemograficas.add_element statusMembroPovoComunidadeTradicional

    statusParticipaGrupoComunitario = REXML::Element.new("statusParticipaGrupoComunitario")
    statusParticipaGrupoComunitario.text = false
    informacoesSocioDemograficas.add_element statusParticipaGrupoComunitario

    identidadeGeneroCidadao = REXML::Element.new("identidadeGeneroCidadao")
    identidadeGeneroCidadao.text = false
    informacoesSocioDemograficas.add_element identidadeGeneroCidadao

    statusDesejaInformarIdentidadeGenero = REXML::Element.new("statusDesejaInformarIdentidadeGenero")
    statusDesejaInformarIdentidadeGenero.text = false
    informacoesSocioDemograficas.add_element statusDesejaInformarIdentidadeGenero

    coPovoComunidadeTradicional = REXML::Element.new("coPovoComunidadeTradicional")
    coPovoComunidadeTradicional.text = false
    informacoesSocioDemograficas.add_element coPovoComunidadeTradicional

    saidaCidadaoCadastro = REXML::Element.new("saidaCidadaoCadastro")

    statusTermoRecusaCadastroIndividualAtencaoBasica = REXML::Element.new("statusTermoRecusaCadastroIndividualAtencaoBasica")
    statusTermoRecusaCadastroIndividualAtencaoBasica.text = false

    tpCdsOrigem = REXML::Element.new("tpCdsOrigem")
    tpCdsOrigem.text = false

    uuid = REXML::Element.new("uuid")
    uuid.text = false

    uuidFichaOriginadora = REXML::Element.new("uuidFichaOriginadora")
    uuidFichaOriginadora.text = false

    headerTransport = REXML::Element.new("headerTransport")

    profissionalCNS = REXML::Element.new("profissionalCNS")
    profissionalCNS.text = false
    headerTransport.add_element profissionalCNS

    cboCodigo_2002 = REXML::Element.new("cboCodigo_2002")
    cboCodigo_2002.text = false
    headerTransport.add_element cboCodigo_2002

    cnes = REXML::Element.new("cnes")
    cnes.text = false
    headerTransport.add_element cnes

    ine = REXML::Element.new("ine")
    ine.text = false
    headerTransport.add_element ine

    dataAtendimento = REXML::Element.new("dataAtendimento")
    dataAtendimento.text = false
    headerTransport.add_element dataAtendimento

    codigoIbgeMunicipio = REXML::Element.new("codigoIbgeMunicipio")
    codigoIbgeMunicipio.text = false
    headerTransport.add_element codigoIbgeMunicipio

    ns4.add_element condicoesDeSaude
    ns4.add_element emSituacaoDeRua
    ns4.add_element fichaAtualizada
    ns4.add_element identificacaoUsuarioCidadao
    ns4.add_element informacoesSocioDemograficas
    ns4.add_element saidaCidadaoCadastro
    ns4.add_element statusTermoRecusaCadastroIndividualAtencaoBasica
    ns4.add_element tpCdsOrigem
    ns4.add_element uuid
    ns4.add_element uuidFichaOriginadora
    ns4.add_element headerTransport

    ns2remetente = REXML::Element.new("ns2:remetentee")
    ns2originadora = REXML::Element.new("ns2:originadora")

    contraChave = REXML::Element.new("contraChave")
    contraChave.text = 'TREINAMENTO'
    ns2remetente.add_element contraChave
    ns2originadora.add_element contraChave

    uuidInstalacao = REXML::Element.new("uuidInstalacao")
    uuidInstalacao.text = 'TREINAMENTO'
    ns2remetente.add_element uuidInstalacao
    ns2originadora.add_element uuidInstalacao

    cpfOuCnpj = REXML::Element.new("cpfOuCnpj")
    cpfOuCnpj.text = 'TREINAMENTO'
    ns2remetente.add_element cpfOuCnpj
    ns2originadora.add_element cpfOuCnpj

    nomeOuRazaoSocial = REXML::Element.new("nomeOuRazaoSocial")
    nomeOuRazaoSocial.text = 'TREINAMENTO'
    ns2remetente.add_element nomeOuRazaoSocial
    ns2originadora.add_element nomeOuRazaoSocial

    versaoSistema = REXML::Element.new("versaoSistema")
    versaoSistema.text = 'TREINAMENTO'
    ns2remetente.add_element versaoSistema
    ns2originadora.add_element versaoSistema

    nomeBancoDados = REXML::Element.new("nomeBancoDados")
    nomeBancoDados.text = 'TREINAMENTO'
    ns2remetente.add_element nomeBancoDados
    ns2originadora.add_element nomeBancoDados

    versao = REXML::Element.new("versao")
    versao.add_attribute 'major', 4
    versao.add_attribute 'minor', 2
    versao.add_attribute 'revision', 1

    ns3.add_element ns4
    ns3.add_element ns2remetente
    ns3.add_element ns2originadora
    ns3.add_element versao

    doc.add_element ns3

    puts doc
  end
end
