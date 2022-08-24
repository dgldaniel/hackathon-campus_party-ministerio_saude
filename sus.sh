docker-compose exec app bundle exec rails g scaffold IndividualRegistration \
statusTemDoencaRespiratoria:boolean \
statusTemTeveDoencasRins:boolean \
statusTeveDoencaCardiaca:boolean \
statusTeveInternadoEm12Meses:boolean \
statusUsaPlantasMedicinais:boolean \
grauParentescoFamiliarFrequentado \
higienePessoalSituacaoRua:array \
origemAlimentoSituacaoRua:array \
outraInstituicaoQueAcompanha \
quantidadeAlimentacoesAoDiaSituacaoRua:integer \
statusAcompanhadoPorOutraInstituicao:boolean \
statusTemAcessoHigienePessoalSituacaoRua:boolean \
statusVisitaFamiliarFrequentemente:boolean \
tempoSituacaoRua:integer \
fichaAtualizada:boolean \
codigoIbgeMunicipioNascimento \
desconheceNomeMae:boolean \
statusEhResponsavel:boolean \
nomePaiCidadao \
desconheceNomePai:boolean \
microArea \
stForaArea:boolean \
deficienciasCidadao:array \
grauInstrucaoCidadao:integer \
ocupacaoCodigoCbo2002 \
statusFrequentaEscola:boolean \
statusMembroPovoComunidadeTradicional:boolean \
statusDesejaInformarIdentidadeGenero:boolean \
coPovoComunidadeTradicional:integer \
statusTermoRecusaCadastroIndividualAtencaoBasica:boolean \
uuid:uuid \
uuidFichaOriginadora:uuid \
profissionalCNS \
cboCodigo_2002 \
cnes \
ine \
dataAtendimento:datetime \
codigoIbgeMunicipio \
uuidDadoSerializado:uuid \
tipoDadoSerializado:integer \
codIbge \
cnesDadoSerializado \
ineDadoSerializado \
numLote:integer \
fichaAtualizada:boolean \
statusTermoRecusaCadastroIndividualAtencaoBasica:boolean \
tpCdsOrigem:integer \
descricaoCausaInternacaoEm12Meses \
descricaoOutraCondicao1 \
descricaoOutraCondicao2 \
descricaoPlantasMedicinaisUsadas \
doencaCardiaca:integer \
doencaRespiratoria:integer \
doencaRins:integer \
maternidadeDeReferencia \
situacaoPeso:integer \
statusEhDependenteAlcool:boolean \
statusEhDependenteOutrasDrogas:boolean \
statusEhFumante:boolean \
statusEhGestante:boolean \
statusEstaAcamado:boolean \
statusEstaDomiciliado:boolean \
statusTemDiabetes:boolean \
statusTemDoencaRespiratoria:boolean \
statusTemHanseniase:boolean \
statusTemHipertensaoArterial:boolean \
statusTemTeveCancer:boolean \
statusTemTeveDoencasRins:boolean \
statusTemTuberculose:boolean \
statusTeveAvcDerrame:boolean \
statusTeveDoencaCardiaca:boolean \
statusTeveInfarto:boolean \
statusTeveInternadoEm12Meses:boolean \
statusUsaPlantasMedicinais:boolean \
statusDiagnosticoMental:boolean \
grauParentescoFamiliarFrequentado \
higienePessoalSituacaoRua:integer \
higienePessoalSituacaoRua:integer \
origemAlimentoSituacaoRua:integer \
origemAlimentoSituacaoRua:integer \
outraInstituicaoQueAcompanha \
quantidadeAlimentacoesAoDiaSituacaoRua:integer \
statusAcompanhadoPorOutraInstituicao:boolean \
statusPossuiReferenciaFamiliar:boolean \
statusRecebeBeneficio:boolean \
statusSituacaoRua:boolean \
statusTemAcessoHigienePessoalSituacaoRua:boolean \
statusVisitaFamiliarFrequentemente:boolean \
tempoSituacaoRua:integer \
codigoIbgeMunicipioNascimento \
dataNascimentoCidadao \
desconheceNomeMae:boolean \
emailCidadao \
nacionalidadeCidadao:integer \
nomeCidadao \
nomeMaeCidadao \
cpfCidadao \
telefoneCelular \
paisNascimento \
racaCorCidadao:integer \
sexoCidadao:integer \
statusEhResponsavel:boolean \
etnia:integer \
nomePaiCidadao \
desconheceNomePai:boolean \
microArea \
stForaArea:boolean \
deficienciasCidadao:integer \
deficienciasCidadao:integer \
ocupacaoCodigoCbo2002 \
orientacaoSexualCidadao:integer \
situacaoMercadoTrabalhoCidadao:integer \
statusDesejaInformarOrientacaoSexual:boolean \
statusFrequentaBenzedeira:boolean \
statusFrequentaEscola:boolean \
statusMembroPovoComunidadeTradicional:boolean \
statusParticipaGrupoComunitario:boolean \
statusPossuiPlanoSaudePrivado:boolean \
statusTemAlgumaDeficiencia:boolean \
identidadeGeneroCidadao:integer \
statusDesejaInformarIdentidadeGenero:boolean \
coPovoComunidadeTradicional:integer

docker-compose exec app bundle exec rails g scaffold Professional \
cnsProfissional \
codigoCbo2002

docker-compose exec app bundle exec rails g scaffold Participant \
cnsParticipante \
dataNascimento:datetime \
avaliacaoAlterada:boolean \
cessouHabitoFumar:boolean \
abandonouGrupo:boolean \
sexo:integer

docker-compose exec app bundle exec rails g scaffold CollectiveActivitySheet \
uuidFicha:uuid \
inep:uuid \
numParticipantes:integer \
numAvaliacoesAlterada:integer \
atividadeTipo:integer \
publicoAlvo:array \
participant:references \
professional:references \
tbCdsOrigem:integer \
procedimento \
turno:integer \
pseEducacao:boolean \
pseSaude:boolean \
temasParaSaude:array \
praticasEmSaude:array

docker-compose exec app bundle exec rails g scaffold ProblemConditionEvaluated \
ciaps:array \
outroCiap1:array \
cid10 \
cid10_2

docker-compose exec app bundle exec rails g scaffold Exam \
codigoExame \
solicitadoAvaliado:array

docker-compose exec app bundle exec rails g scaffold Medicine \
codigoCatmat \
viaAdministracao:integer \
dose \
doseUnica:boolean \
usoContinuo:boolean \
doseFrequenciaTipo:integer \
doseFrequencia \
doseFrequenciaQuantidade:integer \
doseFrequenciaUnidadeMedida:integer \
dtInicioTratamento \
duracaoTratamento:integer \
duracaoTratamentoMedida:integer \
quantidadeReceitada:integer

docker-compose exec app bundle exec rails g scaffold Forwarding \
especialidade:integer \
hipoteseDiagnosticoCid10 \
classificacaoRisco:integer

docker-compose exec app bundle exec rails g scaffold Result \
tipoResultado:integer \
valorResultado

docker-compose exec app bundle exec rails g scaffold ExamResult \
exame \
dataSolicitacao:datetime \
dataRealizacao:datetime \
dataResultado:datetime \
result:references

docker-compose exec app bundle exec rails g scaffold IndividualCall \
numeroProntuario \
cnsCidadao \
dataNascimento:datetime \
localDeAtendimento:integer \
sexo:integer \
turno:integer \
tipoAtendimento:integer \
pesoAcompanhamentoNutricional:float \
alturaAcompanhamentoNutricional:float \
aleitamentoMaterno:integer \
dumDaGestante:datetime \
idadeGestacional:integer \
atencaoDomiciliarModalidade:integer \
vacinaEmDia:boolean \
ficouEmObservacao:boolean \
nasfs:integer \
condutas:array \
stGravidezPlanejada:boolean \
nuGestasPrevias:integer \
nuPartos:integer \
racionalidadeSaude:integer \
perimetroCefalico:float \
dataHoraInicialAtendimento:datetime \
dataHoraFinalAtendimento:datetime \
ExamResult:references \
Professional:references \
Participant:references \
CollectiveActivitySheet:references \
Exam:references \
Medicine:references \
Forwarding:references \
ExamResult:references

docker-compose exec app bundle exec rails g scaffold CollectiveCall \
uuidFicha:uuid \
inep:string \
numParticipantes:integer \
numAvaliacoesAlteradas:integer \
atividadeTipo:integer \
publicoAlvo:array \
tbCdsOrigem:integer \
procedimento:string \
turno:integer \
pseEducacao:boolean \
pseSaude:boolean \
temasParaSaude:array \
praticasEmSaude:array \
Participant:references \
Professional:references

docker-compose exec app bundle exec rails g scaffold CareProcedure \
numProntuario \
cnsCidadao \
dtNascimento \
sexo:integer \
localAtendimento:integer \
turn:integer \
statusEscutaInicialOrientacao:boolean \
procedimentos \
dataHoraInicialAtendimento \
dataHoraFinalAtendimento \
pesoAcompanhamentoNutricional:float \
alturaAcompanhamentoNutricional:float

docker-compose exec app bundle exec rails g scaffold ProcedureSheet \
uuidFicha:uuid \
tpCdsOrigem:integer \
numTotalAfericaoPa:integer \
numTotalAfericaoTemperatura:integer \
numTotalCurativoSimples:integer \
numTotalColetaMaterialParaExameLaboratorial:integer \
numTotalGlicemiaCapilar:integer \
numTotalMedicaoAltura:integer \
numTotalMedicaoPeso:integer
CareProcedure:references

