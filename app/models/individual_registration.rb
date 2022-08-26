# frozen_string_literal: true
# municipios, cbo e comunidade
class IndividualRegistration < ApplicationRecord
  has_one_attached :xml_file

  enum doencaCardiaca: { insuficienciaCardiaca: 24, outro: 25, naoSabe: 26 }
  enum doencaRespiratoria: { asma: 30, dpoc: 31, outro1: 32, naoSabe1: 33 }
  enum doencaRins: { insuficienciaRenal: 27, outro2: 28, naoSabe2: 29 }
  enum situacaoPeso: { abaixo: 21, adequado: 22, acima: 23 }
  enum higienePessoalSituacaoRua: { banho: 42, sanitario: 43, higieneBucal: 44, outros: 45 }
  enum origemAlimentoSituacaoRua: { restaurantePopular: 37, grupoReligioso: 38, doacaoRestaurante: 39, doacaoPopular: 40, outros1: 41 }
  enum quantidadeAlimentacoesAoDiaSituacaoRua: { umaVez: 34, doisOuTresVezes: 35, maisTresVezes: 36 }
  enum tempoSituacaoRua: { menosSeisMeses: 17, seisADozeMeses: 18, umACincoMeses: 19, maisCincoAnos: 20 }
  enum nacionalidadeCidadao: { brasileira: 1, naturalizado: 2, estrangeiro: 3 }
  enum racaCorCidadao: { branca: 1, preta: 2, parda: 4, amarela: 3, indigena: 5, semInfo: 6 }
  enum sexoCidadao: { masculino: 0, feminino: 1, ignorado: 4 }
  enum deficienciasCidadao: { auditiva: 12, visual: 13, intelectual: 14, fisica: 15, outra: 16 }
  enum grauInstrucaoCidadao: {
                               creche: 51,
                               preEscola: 52,
                               alfabetizacao: 53,
                               fundamental1: 54,
                               fundamental2: 55,
                               fundamentalCompleto: 56,
                               fundamentalEspecial: 61,
                               fundamentalEJAInicial: 58,
                               fundamentalEJAFinal: 59,
                               ensinoMedio: 60,
                               ensinoMedioEspecial: 57,
                               ensinoMedioEJA: 62,
                               superior: 63,
                               alfabetizacaoAdulta: 64,
                               nenhum: 65,
                              }
  enum orientacaoSexualCidadao: { heterossexual: 148, homossexual: 153, bissexual: 154, outro5: 155 }
  enum relacaoParentescoCidadao: {
                                  conjugeCompanheiro: 51,
                                  filho: 52,
                                  enteado: 53,
                                  neto: 54,
                                  paiMae: 55,
                                  sogro: 56,
                                  irmaoIrma: 61,
                                  genroNora: 58,
                                  outroParente: 59,
                                  naoParente: 60,
                                }
  enum situacaoMercadoTrabalhoCidadao: {
                                        empregador: 66,
                                        assalariadoComCarteiraTrabalho: 67,
                                        assalariadoSemCarteiraTrabalho: 68,
                                        autonomoComPrevidenciaSocial: 69,
                                        autonomoSemPrevidenciaSocial: 70,
                                        aposentadoPensionista: 71,
                                        desempregado: 72,
                                        naoTrabalha: 73,
                                        servidorPublicoMilitar: 147,
                                        outro6: 74,
                                      }
  enum identidadeGeneroCidadao: { homemTranssexual: 149, mulherTranssexual: 150, travesti: 156, outro3: 151 }
  enum responsavelPorCrianca: { adulto: 1, outrasCriancas: 2, adolescente: 133, sozinha: 3, creche2: 134, outro4: 4 }
  enum motivoSaidaCidadao: { obito: 135, mudancaTerritorio: 136 }

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  private

  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'individual_registrations/show.xml.erb',
      :locals => { :@individual_registration => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{id}.xml"
    )
  end
end
