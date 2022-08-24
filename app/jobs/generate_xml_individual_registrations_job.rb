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
    descricaoCausaInternacaoEm12Meses.text = individual_registration[:alguma_internacao_ultimos_12_meses]
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

    doencaCardiaca = REXML::Element.new("doencaCardiaca")
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
    statusEhDependenteAlcool.text = individual_registration[:uso_alcool]
    condicoesDeSaude.add_element statusEhDependenteAlcool

    statusEhDependenteOutrasDrogas = REXML::Element.new("statusEhDependenteOutrasDrogas")
    statusEhDependenteOutrasDrogas.text = individual_registration[:uso_outras_drogas]
    condicoesDeSaude.add_element statusEhDependenteOutrasDrogas

    statusEhFumante = REXML::Element.new("statusEhFumante")
    statusEhFumante.text = individual_registration[:fumante]
    condicoesDeSaude.add_element statusEhFumante

    statusEhGestante = REXML::Element.new("statusEhGestante")
    statusEhGestante.text = individual_registration[:gestante]
    condicoesDeSaude.add_element statusEhGestante

    statusEstaAcamado = REXML::Element.new("statusEstaAcamado")
    statusEstaAcamado.text = individual_registration[:acamado]
    condicoesDeSaude.add_element statusEstaAcamado

    statusEstaDomiciliado = REXML::Element.new("statusEstaDomiciliado")
    statusEstaDomiciliado.text = individual_registration[:domiciliado]
    condicoesDeSaude.add_element statusEstaDomiciliado

    statusTemDiabetes = REXML::Element.new("statusTemDiabetes")
    statusTemDiabetes.text = individual_registration[:diabetes]
    condicoesDeSaude.add_element statusTemDiabetes

    statusTemDoencaRespiratoria = REXML::Element.new("statusTemDoencaRespiratoria")
    statusTemDoencaRespiratoria.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    condicoesDeSaude.add_element statusTemDoencaRespiratoria

    statusTemHanseniase = REXML::Element.new("statusTemHanseniase")
    statusTemHanseniase.text = individual_registration[:hanseniase]
    condicoesDeSaude.add_element statusTemHanseniase

    statusTemHipertensaoArterial = REXML::Element.new("statusTemHipertensaoArterial")
    statusTemHipertensaoArterial.text = individual_registration[:hipertensao_arterial]
    condicoesDeSaude.add_element statusTemHipertensaoArterial

    statusTemTeveCancer = REXML::Element.new("statusTemTeveCancer")
    statusTemTeveCancer.text = individual_registration[:tem_ou_teve_cancer]
    condicoesDeSaude.add_element statusTemTeveCancer

    statusTemTeveDoencasRins = REXML::Element.new("statusTemTeveDoencasRins")
    statusTemTeveDoencasRins.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    condicoesDeSaude.add_element statusTemTeveDoencasRins

    statusTemTuberculose = REXML::Element.new("statusTemTuberculose")
    statusTemTuberculose.text = individual_registration[:tuberculose]
    condicoesDeSaude.add_element statusTemTuberculose

    statusTeveAvcDerrame = REXML::Element.new("statusTeveAvcDerrame")
    statusTeveAvcDerrame.text = individual_registration[:avc_derrame]
    condicoesDeSaude.add_element statusTeveAvcDerrame

    statusTeveDoencaCardiaca = REXML::Element.new("statusTeveDoencaCardiaca")
    statusTeveDoencaCardiaca.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    condicoesDeSaude.add_element statusTeveDoencaCardiaca

    statusTeveInfarto = REXML::Element.new("statusTeveInfarto")
    statusTeveInfarto.text = individual_registration[:infarto]
    condicoesDeSaude.add_element statusTeveInfarto

    statusTeveInternadoEm12Meses = REXML::Element.new("statusTeveInternadoEm12Meses")
    statusTeveInternadoEm12Meses.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    condicoesDeSaude.add_element statusTeveInternadoEm12Meses

    statusUsaPlantasMedicinais = REXML::Element.new("statusUsaPlantasMedicinais")
    statusUsaPlantasMedicinais.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    condicoesDeSaude.add_element statusUsaPlantasMedicinais

    statusDiagnosticoMental = REXML::Element.new("statusDiagnosticoMental")
    statusDiagnosticoMental.text = individual_registration[:diagnostico_algum_problema_saude_mental_profissional_saude]
    condicoesDeSaude.add_element statusDiagnosticoMental

    emSituacaoDeRua = REXML::Element.new("emSituacaoDeRua")

    grauParentescoFamiliarFrequentado = REXML::Element.new("grauParentescoFamiliarFrequentado")
    grauParentescoFamiliarFrequentado.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element grauParentescoFamiliarFrequentado

    higienePessoalSituacaoRua = REXML::Element.new("higienePessoalSituacaoRua")
    higienePessoalSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element higienePessoalSituacaoRua

    higienePessoalSituacaoRua = REXML::Element.new("higienePessoalSituacaoRua")
    higienePessoalSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element higienePessoalSituacaoRua

    origemAlimentoSituacaoRua = REXML::Element.new("origemAlimentoSituacaoRua")
    origemAlimentoSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element origemAlimentoSituacaoRua

    origemAlimentoSituacaoRua = REXML::Element.new("origemAlimentoSituacaoRua")
    origemAlimentoSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element origemAlimentoSituacaoRua

    outraInstituicaoQueAcompanha = REXML::Element.new("outraInstituicaoQueAcompanha")
    outraInstituicaoQueAcompanha.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element outraInstituicaoQueAcompanha

    quantidadeAlimentacoesAoDiaSituacaoRua = REXML::Element.new("quantidadeAlimentacoesAoDiaSituacaoRua")
    quantidadeAlimentacoesAoDiaSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element quantidadeAlimentacoesAoDiaSituacaoRua

    statusAcompanhadoPorOutraInstituicao = REXML::Element.new("statusAcompanhadoPorOutraInstituicao")
    statusAcompanhadoPorOutraInstituicao.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element statusAcompanhadoPorOutraInstituicao

    statusPossuiReferenciaFamiliar = REXML::Element.new("statusPossuiReferenciaFamiliar")
    statusPossuiReferenciaFamiliar.text = individual_registration[:possui_referencia_familiar]
    emSituacaoDeRua.add_element statusPossuiReferenciaFamiliar

    statusRecebeBeneficio = REXML::Element.new("statusRecebeBeneficio")
    statusRecebeBeneficio.text = individual_registration[:recebe_algum_beneficio]
    emSituacaoDeRua.add_element statusRecebeBeneficio

    statusSituacaoRua = REXML::Element.new("statusSituacaoRua")
    statusSituacaoRua.text = individual_registration[:situacao_rua]
    emSituacaoDeRua.add_element statusSituacaoRua

    statusTemAcessoHigienePessoalSituacaoRua = REXML::Element.new("statusTemAcessoHigienePessoalSituacaoRua")
    statusTemAcessoHigienePessoalSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element statusTemAcessoHigienePessoalSituacaoRua

    statusVisitaFamiliarFrequentemente = REXML::Element.new("statusVisitaFamiliarFrequentemente")
    statusVisitaFamiliarFrequentemente.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element statusVisitaFamiliarFrequentemente

    tempoSituacaoRua = REXML::Element.new("tempoSituacaoRua")
    tempoSituacaoRua.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    emSituacaoDeRua.add_element tempoSituacaoRua

    fichaAtualizada = REXML::Element.new("fichaAtualizada")
    fichaAtualizada.text = individual_registration[:alguma_internacao_ultimos_12_meses]

    identificacaoUsuarioCidadao = REXML::Element.new("identificacaoUsuarioCidadao")

    codigoIbgeMunicipioNascimento = REXML::Element.new("codigoIbgeMunicipioNascimento")
    codigoIbgeMunicipioNascimento.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element codigoIbgeMunicipioNascimento

    dataNascimentoCidadao = REXML::Element.new("dataNascimentoCidadao")
    dataNascimentoCidadao.text = individual_registration[:data_nascimento]
    identificacaoUsuarioCidadao.add_element dataNascimentoCidadao

    desconheceNomeMae = REXML::Element.new("desconheceNomeMae")
    desconheceNomeMae.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element desconheceNomeMae

    emailCidadao = REXML::Element.new("emailCidadao")
    emailCidadao.text = individual_registration[:email]
    identificacaoUsuarioCidadao.add_element emailCidadao

    nacionalidadeCidadao = REXML::Element.new("nacionalidadeCidadao")
    nacionalidadeCidadao.text = individual_registration[:nacionalidade]
    identificacaoUsuarioCidadao.add_element nacionalidadeCidadao

    nomeCidadao = REXML::Element.new("nomeCidadao")
    nomeCidadao.text = individual_registration[:nome_completo]
    identificacaoUsuarioCidadao.add_element nomeCidadao

    nomeMaeCidadao = REXML::Element.new("nomeMaeCidadao")
    nomeMaeCidadao.text = individual_registration[:nome_completo_ma]
    identificacaoUsuarioCidadao.add_element nomeMaeCidadao

    cpfCidadao = REXML::Element.new("cpfCidadao")
    cpfCidadao.text = individual_registration[:cns_cpf_cidadao]
    identificacaoUsuarioCidadao.add_element cpfCidadao

    telefoneCelular = REXML::Element.new("telefoneCelular")
    telefoneCelular.text = individual_registration[:telefone_celular]
    identificacaoUsuarioCidadao.add_element telefoneCelular

    paisNascimento = REXML::Element.new("paisNascimento")
    paisNascimento.text = individual_registration[:pais_nascimento]
    identificacaoUsuarioCidadao.add_element paisNascimento

    racaCorCidadao = REXML::Element.new("racaCorCidadao")
    racaCorCidadao.text = individual_registration[:raca_cor]
    identificacaoUsuarioCidadao.add_element racaCorCidadao

    sexoCidadao = REXML::Element.new("sexoCidadao")
    sexoCidadao.text = individual_registration[:sexo]
    identificacaoUsuarioCidadao.add_element sexoCidadao

    statusEhResponsavel = REXML::Element.new("statusEhResponsavel")
    statusEhResponsavel.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element statusEhResponsavel

    etnia = REXML::Element.new("etnia")
    etnia.text = individual_registration[:etnia]
    identificacaoUsuarioCidadao.add_element etnia

    nomePaiCidadao = REXML::Element.new("nomePaiCidadao")
    nomePaiCidadao.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element nomePaiCidadao

    desconheceNomePai = REXML::Element.new("desconheceNomePai")
    desconheceNomePai.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element desconheceNomePai

    microArea = REXML::Element.new("microArea")
    microArea.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element microArea

    stForaArea = REXML::Element.new("stForaArea")
    stForaArea.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    identificacaoUsuarioCidadao.add_element stForaArea

    informacoesSocioDemograficas = REXML::Element.new("informacoesSocioDemograficas")

    deficienciasCidadao = REXML::Element.new("deficienciasCidadao")
    deficienciasCidadao.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element deficienciasCidadao

    deficienciasCidadao = REXML::Element.new("deficienciasCidadao")
    deficienciasCidadao.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element deficienciasCidadao

    grauInstrucaoCidadao = REXML::Element.new("grauInstrucaoCidadao")
    grauInstrucaoCidadao.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element grauInstrucaoCidadao

    ocupacaoCodigoCbo2002 = REXML::Element.new("ocupacaoCodigoCbo2002")
    ocupacaoCodigoCbo2002.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element ocupacaoCodigoCbo2002

    orientacaoSexualCidadao = REXML::Element.new("orientacaoSexualCidadao")
    orientacaoSexualCidadao.text = individual_registration[:orientacao_sexual]
    informacoesSocioDemograficas.add_element orientacaoSexualCidadao

    situacaoMercadoTrabalhoCidadao = REXML::Element.new("situacaoMercadoTrabalhoCidadao")
    situacaoMercadoTrabalhoCidadao.text = individual_registration[:situacao_mercado_trabalho]
    informacoesSocioDemograficas.add_element situacaoMercadoTrabalhoCidadao

    statusFrequentaBenzedeira = REXML::Element.new("statusFrequentaBenzedeira")
    statusFrequentaBenzedeira.text = individual_registration[:frequenta_cuidador_tradicional]
    informacoesSocioDemograficas.add_element statusFrequentaBenzedeira

    statusFrequentaEscola = REXML::Element.new("statusFrequentaEscola")
    statusFrequentaEscola.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element statusFrequentaEscola

    statusMembroPovoComunidadeTradicional = REXML::Element.new("statusMembroPovoComunidadeTradicional")
    statusMembroPovoComunidadeTradicional.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element statusMembroPovoComunidadeTradicional

    statusParticipaGrupoComunitario = REXML::Element.new("statusParticipaGrupoComunitario")
    statusParticipaGrupoComunitario.text = individual_registration[:participa_grupo_comunitario]
    informacoesSocioDemograficas.add_element statusParticipaGrupoComunitario

    identidadeGeneroCidadao = REXML::Element.new("identidadeGeneroCidadao")
    identidadeGeneroCidadao.text = individual_registration[:identidade_genero]
    informacoesSocioDemograficas.add_element identidadeGeneroCidadao

    statusDesejaInformarIdentidadeGenero = REXML::Element.new("statusDesejaInformarIdentidadeGenero")
    statusDesejaInformarIdentidadeGenero.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element statusDesejaInformarIdentidadeGenero

    coPovoComunidadeTradicional = REXML::Element.new("coPovoComunidadeTradicional")
    coPovoComunidadeTradicional.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    informacoesSocioDemograficas.add_element coPovoComunidadeTradicional

    saidaCidadaoCadastro = REXML::Element.new("saidaCidadaoCadastro")

    statusTermoRecusaCadastroIndividualAtencaoBasica = REXML::Element.new("statusTermoRecusaCadastroIndividualAtencaoBasica")
    statusTermoRecusaCadastroIndividualAtencaoBasica.text = individual_registration[:alguma_internacao_ultimos_12_meses]

    tpCdsOrigem = REXML::Element.new("tpCdsOrigem")
    tpCdsOrigem.text = individual_registration[:alguma_internacao_ultimos_12_meses]

    uuid = REXML::Element.new("uuid")
    uuid.text = individual_registration[:alguma_internacao_ultimos_12_meses]

    uuidFichaOriginadora = REXML::Element.new("uuidFichaOriginadora")
    uuidFichaOriginadora.text = individual_registration[:alguma_internacao_ultimos_12_meses]

    headerTransport = REXML::Element.new("headerTransport")

    profissionalCNS = REXML::Element.new("profissionalCNS")
    profissionalCNS.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    headerTransport.add_element profissionalCNS

    cboCodigo_2002 = REXML::Element.new("cboCodigo_2002")
    cboCodigo_2002.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    headerTransport.add_element cboCodigo_2002

    cnes = REXML::Element.new("cnes")
    cnes.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    headerTransport.add_element cnes

    ine = REXML::Element.new("ine")
    ine.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    headerTransport.add_element ine

    dataAtendimento = REXML::Element.new("dataAtendimento")
    dataAtendimento.text = individual_registration[:alguma_internacao_ultimos_12_meses]
    headerTransport.add_element dataAtendimento

    codigoIbgeMunicipio = REXML::Element.new("codigoIbgeMunicipio")
    codigoIbgeMunicipio.text = individual_registration[:alguma_internacao_ultimos_12_meses]
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

    ns2remetente = REXML::Element.new("ns2:remetente")
    ns2originadora = REXML::Element.new("ns2:originadora")

    contraChave = REXML::Element.new("contraChave")
    contraChave2 = REXML::Element.new("contraChave")
    contraChave.text = 'TREINAMENTO'
    contraChave2.text = 'TREINAMENTO'
    ns2remetente.add_element contraChave
    ns2originadora.add_element contraChave2

    uuidInstalacao = REXML::Element.new("uuidInstalacao")
    uuidInstalacao2 = REXML::Element.new("uuidInstalacao")
    uuidInstalacao.text = 'TREINAMENTO'
    uuidInstalacao2.text = 'TREINAMENTO'
    ns2remetente.add_element uuidInstalacao
    ns2originadora.add_element uuidInstalacao2

    cpfOuCnpj = REXML::Element.new("cpfOuCnpj")
    cpfOuCnpj2 = REXML::Element.new("cpfOuCnpj")
    cpfOuCnpj.text = '01234567890'
    cpfOuCnpj2.text = '01234567890'
    ns2remetente.add_element cpfOuCnpj
    ns2originadora.add_element cpfOuCnpj2

    nomeOuRazaoSocial = REXML::Element.new("nomeOuRazaoSocial")
    nomeOuRazaoSocial2 = REXML::Element.new("nomeOuRazaoSocial")
    nomeOuRazaoSocial.text = 'ADMINISTRADOR INSTALAÇÃO'
    nomeOuRazaoSocial2.text = 'ADMINISTRADOR INSTALAÇÃO'
    ns2remetente.add_element nomeOuRazaoSocial
    ns2originadora.add_element nomeOuRazaoSocial2

    versaoSistema = REXML::Element.new("versaoSistema")
    versaoSistema2 = REXML::Element.new("versaoSistema")
    versaoSistema.text = '3.2.18'
    versaoSistema2.text = '3.2.18'
    ns2remetente.add_element versaoSistema
    ns2originadora.add_element versaoSistema2

    nomeBancoDados = REXML::Element.new("nomeBancoDados")
    nomeBancoDados2 = REXML::Element.new("nomeBancoDados")
    nomeBancoDados.text = 'Oracle'
    nomeBancoDados2.text = 'Oracle'
    ns2remetente.add_element nomeBancoDados
    ns2originadora.add_element nomeBancoDados2

    versao = REXML::Element.new("versao")
    versao.add_attribute 'major', 4
    versao.add_attribute 'minor', 2
    versao.add_attribute 'revision', 1

    ns3.add_element ns4
    ns3.add_element ns2remetente
    ns3.add_element ns2originadora
    ns3.add_element versao

    doc.add_element ns3

    doc.write(File.open("#{individual_registration[:id]}.xml","w"))

    individual_registration.registration_xml.attach(
      io: File.open("#{individual_registration[:id]}.xml"),
      filename: "#{individual_registration[:id]}.xml"
    )

    File.delete("#{individual_registration[:id]}.xml")
  end
end

