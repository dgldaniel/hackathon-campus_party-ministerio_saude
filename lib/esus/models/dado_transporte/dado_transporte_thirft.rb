# frozen_string_literal: true
class DadoTransporteGerenciarThrift
  require 'thrift'
  require 'date'

  require_relative './dado_transporte_types'
  require_relative '../common_types'

  def initialize(doctor, serialized_file)
    @doctor = doctor
    @serialized_file = serialized_file
  end

  def serializar
    header_thrift = Br::Gov::Saude::Esusab::Ras::Common::UnicaLotacaoHeaderThrift.new

    header_thrift.profissionalCNS = @doctor.profissionalCNS
    header_thrift.cboCodigo_2002 = @doctor.cboCodigo_2002
    header_thrift.cnes = @doctor.cnes
    header_thrift.ine = @doctor.ine
    header_thrift.dataAtendimento = Time.now.to_i
    header_thrift.codigoIbgeMunicipio = @doctor.codigoIbgeMunicipio

    originadora = Br::Gov::Saude::Esusab::Dadotransp::DadoInstalacaoThrift.new
    remetente = Br::Gov::Saude::Esusab::Dadotransp::DadoInstalacaoThrift.new
    dado_transporte_instance = Br::Gov::Saude::Esusab::Dadotransp::DadoTransporteThrift.new
    versao_thrift = Br::Gov::Saude::Esusab::Dadotransp::VersaoThrift.new

    originadora.contraChave = '123456'
    originadora.uuidInstalacao = 'UUIDUNICO111'
    originadora.cpfOuCnpj = '11111111111'
    originadora.nomeOuRazaoSocial = 'Nome ou Razao Social Originadora'
    originadora.fone = '999999999'
    originadora.email = 'a@b.com'

    dado_transporte_instance.originadora = originadora

    remetente.contraChave = '789010'
    remetente.uuidInstalacao = 'UUIDUNICO222'
    remetente.cpfOuCnpj = '11111111111'
    remetente.nomeOuRazaoSocial = 'Nome ou Razao Social Remetente'
    remetente.fone = '98888888'
    remetente.email = 'b@a.com'

    dado_transporte_instance.remetente = originadora
    dado_transporte_instance.numLote = 1
    dado_transporte_instance.tipoDadoSerializado = 2

    versao_thrift.major = 3
    versao_thrift.minor = 2
    versao_thrift.revision = 3

    dado_transporte_instance.versao = versao_thrift
    dado_transporte_instance.dadoSerializado = @serialized_file

    dado_transporte_serializador = Thrift::Serializer.new
    dado_transporte_serializado = dado_transporte_serializador.serialize(dado_transporte_instance)

    dado_transporte_serializado
  end
end
