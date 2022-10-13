# frozen_string_literal: true
#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative '../common_types'

module Br
  module Gov
    module Saude
      module Esusab
        module Ras
          module Cadastroindividual
            class CondicoesDeSaudeThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              DESCRICAOCAUSAINTERNACAOEM12MESES = 1
              DESCRICAOOUTRACONDICAO1 = 2
              DESCRICAOOUTRACONDICAO2 = 3
              DESCRICAOOUTRACONDICAO3 = 4
              DESCRICAOPLANTASMEDICINAISUSADAS = 5
              DOENCACARDIACA = 6
              DOENCARESPIRATORIA = 7
              DOENCARINS = 8
              MATERNIDADEDEREFERENCIA = 9
              SITUACAOPESO = 10
              STATUSEHDEPENDENTEALCOOL = 11
              STATUSEHDEPENDENTEOUTRASDROGAS = 12
              STATUSEHFUMANTE = 13
              STATUSEHGESTANTE = 14
              STATUSESTAACAMADO = 15
              STATUSESTADOMICILIADO = 16
              STATUSTEMDIABETES = 17
              STATUSTEMDOENCARESPIRATORIA = 18
              STATUSTEMHANSENIASE = 19
              STATUSTEMHIPERTENSAOARTERIAL = 20
              STATUSTEMTEVECANCER = 21
              STATUSTEMTEVEDOENCASRINS = 22
              STATUSTEMTUBERCULOSE = 23
              STATUSTEVEAVCDERRAME = 24
              STATUSTEVEDOENCACARDIACA = 25
              STATUSTEVEINFARTO = 26
              STATUSTEVEINTERNADOEM12MESES = 27
              STATUSUSAOUTRASPRATICASINTEGRATIVASOUCOMPLEMENTARES = 29
              STATUSUSAPLANTAMEDICINAIS = 30
              STATUSDIAGNOSTICOMENTAL = 31

              FIELDS = {
                DESCRICAOCAUSAINTERNACAOEM12MESES => {:type => ::Thrift::Types::STRING, :name => 'descricaoCausaInternacaoEm12Meses', :optional => true},
                DESCRICAOOUTRACONDICAO1 => {:type => ::Thrift::Types::STRING, :name => 'descricaoOutraCondicao1', :optional => true},
                DESCRICAOOUTRACONDICAO2 => {:type => ::Thrift::Types::STRING, :name => 'descricaoOutraCondicao2', :optional => true},
                DESCRICAOOUTRACONDICAO3 => {:type => ::Thrift::Types::STRING, :name => 'descricaoOutraCondicao3', :optional => true},
                DESCRICAOPLANTASMEDICINAISUSADAS => {:type => ::Thrift::Types::STRING, :name => 'descricaoPlantasMedicinaisUsadas', :optional => true},
                DOENCACARDIACA => {:type => ::Thrift::Types::LIST, :name => 'doencaCardiaca', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                DOENCARESPIRATORIA => {:type => ::Thrift::Types::LIST, :name => 'doencaRespiratoria', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                DOENCARINS => {:type => ::Thrift::Types::LIST, :name => 'doencaRins', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                MATERNIDADEDEREFERENCIA => {:type => ::Thrift::Types::STRING, :name => 'maternidadeDeReferencia', :optional => true},
                SITUACAOPESO => {:type => ::Thrift::Types::I64, :name => 'situacaoPeso', :optional => true},
                STATUSEHDEPENDENTEALCOOL => {:type => ::Thrift::Types::BOOL, :name => 'statusEhDependenteAlcool', :optional => true},
                STATUSEHDEPENDENTEOUTRASDROGAS => {:type => ::Thrift::Types::BOOL, :name => 'statusEhDependenteOutrasDrogas', :optional => true},
                STATUSEHFUMANTE => {:type => ::Thrift::Types::BOOL, :name => 'statusEhFumante', :optional => true},
                STATUSEHGESTANTE => {:type => ::Thrift::Types::BOOL, :name => 'statusEhGestante', :optional => true},
                STATUSESTAACAMADO => {:type => ::Thrift::Types::BOOL, :name => 'statusEstaAcamado', :optional => true},
                STATUSESTADOMICILIADO => {:type => ::Thrift::Types::BOOL, :name => 'statusEstaDomiciliado', :optional => true},
                STATUSTEMDIABETES => {:type => ::Thrift::Types::BOOL, :name => 'statusTemDiabetes', :optional => true},
                STATUSTEMDOENCARESPIRATORIA => {:type => ::Thrift::Types::BOOL, :name => 'statusTemDoencaRespiratoria', :optional => true},
                STATUSTEMHANSENIASE => {:type => ::Thrift::Types::BOOL, :name => 'statusTemHanseniase', :optional => true},
                STATUSTEMHIPERTENSAOARTERIAL => {:type => ::Thrift::Types::BOOL, :name => 'statusTemHipertensaoArterial', :optional => true},
                STATUSTEMTEVECANCER => {:type => ::Thrift::Types::BOOL, :name => 'statusTemTeveCancer', :optional => true},
                STATUSTEMTEVEDOENCASRINS => {:type => ::Thrift::Types::BOOL, :name => 'statusTemTeveDoencasRins', :optional => true},
                STATUSTEMTUBERCULOSE => {:type => ::Thrift::Types::BOOL, :name => 'statusTemTuberculose', :optional => true},
                STATUSTEVEAVCDERRAME => {:type => ::Thrift::Types::BOOL, :name => 'statusTeveAvcDerrame', :optional => true},
                STATUSTEVEDOENCACARDIACA => {:type => ::Thrift::Types::BOOL, :name => 'statusTeveDoencaCardiaca', :optional => true},
                STATUSTEVEINFARTO => {:type => ::Thrift::Types::BOOL, :name => 'statusTeveInfarto', :optional => true},
                STATUSTEVEINTERNADOEM12MESES => {:type => ::Thrift::Types::BOOL, :name => 'statusTeveInternadoEm12Meses', :optional => true},
                STATUSUSAOUTRASPRATICASINTEGRATIVASOUCOMPLEMENTARES => {:type => ::Thrift::Types::BOOL, :name => 'statusUsaOutrasPraticasIntegrativasOuComplementares', :optional => true},
                STATUSUSAPLANTAMEDICINAIS => {:type => ::Thrift::Types::BOOL, :name => 'statusUsaPlantaMedicinais', :optional => true},
                STATUSDIAGNOSTICOMENTAL => {:type => ::Thrift::Types::BOOL, :name => 'statusDiagnosticoMental', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
              end

              ::Thrift::Struct.generate_accessors(self)
            end

            class EmSituacaoDeRuaThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              GRAUPARENTESCOFAMILIARFREQUENTADO = 1
              HIGIENEPESSOALSITUACAORUA = 2
              ORIGEMALIMENTOSITUACAORUA = 3
              OUTRAINSTITUICAOQUEACOMPANHA = 4
              QUANTIDADEALIMENTACOESAODIASITUACAORUA = 5
              STATUSACOMPANHADOPOROUTRAINSTITUICAO = 6
              STATUSPOSSUIREFERENCIAFAMILIAR = 7
              STATUSRECEBEBENEFICIO = 8
              STATUSSITUACAORUA = 9
              STATUSTEMACESSOHIGIENEPESSOALSITUACAORUA = 10
              STATUSVISITAFAMILIARFREQUENTEMENTE = 11
              TEMPOSITUACAORUA = 12

              FIELDS = {
                GRAUPARENTESCOFAMILIARFREQUENTADO => {:type => ::Thrift::Types::STRING, :name => 'grauParentescoFamiliarFrequentado', :optional => true},
                HIGIENEPESSOALSITUACAORUA => {:type => ::Thrift::Types::LIST, :name => 'higienePessoalSituacaoRua', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                ORIGEMALIMENTOSITUACAORUA => {:type => ::Thrift::Types::LIST, :name => 'origemAlimentoSituacaoRua', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                OUTRAINSTITUICAOQUEACOMPANHA => {:type => ::Thrift::Types::STRING, :name => 'outraInstituicaoQueAcompanha', :optional => true},
                QUANTIDADEALIMENTACOESAODIASITUACAORUA => {:type => ::Thrift::Types::I64, :name => 'quantidadeAlimentacoesAoDiaSituacaoRua', :optional => true},
                STATUSACOMPANHADOPOROUTRAINSTITUICAO => {:type => ::Thrift::Types::BOOL, :name => 'statusAcompanhadoPorOutraInstituicao', :optional => true},
                STATUSPOSSUIREFERENCIAFAMILIAR => {:type => ::Thrift::Types::BOOL, :name => 'statusPossuiReferenciaFamiliar', :optional => true},
                STATUSRECEBEBENEFICIO => {:type => ::Thrift::Types::BOOL, :name => 'statusRecebeBeneficio', :optional => true},
                STATUSSITUACAORUA => {:type => ::Thrift::Types::BOOL, :name => 'statusSituacaoRua', :optional => true},
                STATUSTEMACESSOHIGIENEPESSOALSITUACAORUA => {:type => ::Thrift::Types::BOOL, :name => 'statusTemAcessoHigienePessoalSituacaoRua', :optional => true},
                STATUSVISITAFAMILIARFREQUENTEMENTE => {:type => ::Thrift::Types::BOOL, :name => 'statusVisitaFamiliarFrequentemente', :optional => true},
                TEMPOSITUACAORUA => {:type => ::Thrift::Types::I64, :name => 'tempoSituacaoRua', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
              end

              ::Thrift::Struct.generate_accessors(self)
            end

            class IdentificacaoUsuarioCidadaoThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              NOMESOCIAL = 1
              CODIGOIBGEMUNICIPIONASCIMENTO = 2
              DATANASCIMENTOCIDADAO = 3
              DESCONHECENOMEMAE = 5
              EMAILCIDADAO = 6
              NACIONALIDADECIDADAO = 7
              NOMECIDADAO = 8
              NOMEMAECIDADAO = 9
              CNSCIDADAO = 10
              CNSRESPONSAVELFAMILIAR = 11
              TELEFONECELULAR = 12
              NUMERONISPISPASEP = 13
              PAISNASCIMENTO = 14
              RACACORCIDADAO = 15
              SEXOCIDADAO = 16
              STATUSEHRESPONSAVEL = 17
              ETNIA = 18
              NOMEPAICIDADAO = 19
              DESCONHECENOMEPAI = 20
              DTNATURALIZACAO = 21
              PORTARIANATURALIZACAO = 22
              DTENTRADABRASIL = 23
              MICROAREA = 24
              STFORAAREA = 25
              CPFCIDADAO = 26
              CPFRESPONSAVELFAMILIAR = 27

              FIELDS = {
                NOMESOCIAL => {:type => ::Thrift::Types::STRING, :name => 'nomeSocial', :optional => true},
                CODIGOIBGEMUNICIPIONASCIMENTO => {:type => ::Thrift::Types::STRING, :name => 'codigoIbgeMunicipioNascimento', :optional => true},
                DATANASCIMENTOCIDADAO => {:type => ::Thrift::Types::I64, :name => 'dataNascimentoCidadao', :optional => true},
                DESCONHECENOMEMAE => {:type => ::Thrift::Types::BOOL, :name => 'desconheceNomeMae', :optional => true},
                EMAILCIDADAO => {:type => ::Thrift::Types::STRING, :name => 'emailCidadao', :optional => true},
                NACIONALIDADECIDADAO => {:type => ::Thrift::Types::I64, :name => 'nacionalidadeCidadao', :optional => true},
                NOMECIDADAO => {:type => ::Thrift::Types::STRING, :name => 'nomeCidadao', :optional => true},
                NOMEMAECIDADAO => {:type => ::Thrift::Types::STRING, :name => 'nomeMaeCidadao', :optional => true},
                CNSCIDADAO => {:type => ::Thrift::Types::STRING, :name => 'cnsCidadao', :optional => true},
                CNSRESPONSAVELFAMILIAR => {:type => ::Thrift::Types::STRING, :name => 'cnsResponsavelFamiliar', :optional => true},
                TELEFONECELULAR => {:type => ::Thrift::Types::STRING, :name => 'telefoneCelular', :optional => true},
                NUMERONISPISPASEP => {:type => ::Thrift::Types::STRING, :name => 'numeroNisPisPasep', :optional => true},
                PAISNASCIMENTO => {:type => ::Thrift::Types::I64, :name => 'paisNascimento', :optional => true},
                RACACORCIDADAO => {:type => ::Thrift::Types::I64, :name => 'racaCorCidadao', :optional => true},
                SEXOCIDADAO => {:type => ::Thrift::Types::I64, :name => 'sexoCidadao', :optional => true},
                STATUSEHRESPONSAVEL => {:type => ::Thrift::Types::BOOL, :name => 'statusEhResponsavel', :optional => true},
                ETNIA => {:type => ::Thrift::Types::I64, :name => 'etnia', :optional => true},
                NOMEPAICIDADAO => {:type => ::Thrift::Types::STRING, :name => 'nomePaiCidadao', :optional => true},
                DESCONHECENOMEPAI => {:type => ::Thrift::Types::BOOL, :name => 'desconheceNomePai', :optional => true},
                DTNATURALIZACAO => {:type => ::Thrift::Types::I64, :name => 'dtNaturalizacao', :optional => true},
                PORTARIANATURALIZACAO => {:type => ::Thrift::Types::STRING, :name => 'portariaNaturalizacao', :optional => true},
                DTENTRADABRASIL => {:type => ::Thrift::Types::I64, :name => 'dtEntradaBrasil', :optional => true},
                MICROAREA => {:type => ::Thrift::Types::STRING, :name => 'microArea', :optional => true},
                STFORAAREA => {:type => ::Thrift::Types::BOOL, :name => 'stForaArea', :optional => true},
                CPFCIDADAO => {:type => ::Thrift::Types::STRING, :name => 'cpfCidadao', :optional => true},
                CPFRESPONSAVELFAMILIAR => {:type => ::Thrift::Types::STRING, :name => 'cpfResponsavelFamiliar', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
              end

              ::Thrift::Struct.generate_accessors(self)
            end

            class InformacoesSocioDemograficasThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              DEFICIENCIASCIDADAO = 1
              GRAUINSTRUCAOCIDADAO = 2
              OCUPACAOCODIGOCBO2002 = 4
              ORIENTACAOSEXUALCIDADAO = 5
              RELACAOPARENTESCOCIDADAO = 7
              SITUACAOMERCADOTRABALHOCIDADAO = 9
              STATUSDESEJAINFORMARORIENTACAOSEXUAL = 10
              STATUSFREQUENTABENZEDEIRA = 11
              STATUSFREQUENTAESCOLA = 12
              STATUSMEMBROPOVOCOMUNIDADETRADICIONAL = 13
              STATUSPARTICIPAGRUPOCOMUNITARIO = 14
              STATUSPOSSUIPLANOSAUDEPRIVADO = 15
              STATUSTEMALGUMADEFICIENCIA = 16
              IDENTIDADEGENEROCIDADAO = 17
              STATUSDESEJAINFORMARIDENTIDADEGENERO = 18
              RESPONSAVELPORCRIANCA = 19
              COPOVOCOMUNIDADETRADICIONAL = 20

              FIELDS = {
                DEFICIENCIASCIDADAO => {:type => ::Thrift::Types::LIST, :name => 'deficienciasCidadao', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                GRAUINSTRUCAOCIDADAO => {:type => ::Thrift::Types::I64, :name => 'grauInstrucaoCidadao', :optional => true},
                OCUPACAOCODIGOCBO2002 => {:type => ::Thrift::Types::STRING, :name => 'ocupacaoCodigoCbo2002', :optional => true},
                ORIENTACAOSEXUALCIDADAO => {:type => ::Thrift::Types::I64, :name => 'orientacaoSexualCidadao', :optional => true},
                RELACAOPARENTESCOCIDADAO => {:type => ::Thrift::Types::I64, :name => 'relacaoParentescoCidadao', :optional => true},
                SITUACAOMERCADOTRABALHOCIDADAO => {:type => ::Thrift::Types::I64, :name => 'situacaoMercadoTrabalhoCidadao', :optional => true},
                STATUSDESEJAINFORMARORIENTACAOSEXUAL => {:type => ::Thrift::Types::BOOL, :name => 'statusDesejaInformarOrientacaoSexual', :optional => true},
                STATUSFREQUENTABENZEDEIRA => {:type => ::Thrift::Types::BOOL, :name => 'statusFrequentaBenzedeira', :optional => true},
                STATUSFREQUENTAESCOLA => {:type => ::Thrift::Types::BOOL, :name => 'statusFrequentaEscola', :optional => true},
                STATUSMEMBROPOVOCOMUNIDADETRADICIONAL => {:type => ::Thrift::Types::BOOL, :name => 'statusMembroPovoComunidadeTradicional', :optional => true},
                STATUSPARTICIPAGRUPOCOMUNITARIO => {:type => ::Thrift::Types::BOOL, :name => 'statusParticipaGrupoComunitario', :optional => true},
                STATUSPOSSUIPLANOSAUDEPRIVADO => {:type => ::Thrift::Types::BOOL, :name => 'statusPossuiPlanoSaudePrivado', :optional => true},
                STATUSTEMALGUMADEFICIENCIA => {:type => ::Thrift::Types::BOOL, :name => 'statusTemAlgumaDeficiencia', :optional => true},
                IDENTIDADEGENEROCIDADAO => {:type => ::Thrift::Types::I64, :name => 'identidadeGeneroCidadao', :optional => true},
                STATUSDESEJAINFORMARIDENTIDADEGENERO => {:type => ::Thrift::Types::BOOL, :name => 'statusDesejaInformarIdentidadeGenero', :optional => true},
                RESPONSAVELPORCRIANCA => {:type => ::Thrift::Types::LIST, :name => 'responsavelPorCrianca', :element => {:type => ::Thrift::Types::I64}, :optional => true},
                COPOVOCOMUNIDADETRADICIONAL => {:type => ::Thrift::Types::I64, :name => 'coPovoComunidadeTradicional', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
              end

              ::Thrift::Struct.generate_accessors(self)
            end

            class SaidaCidadaoCadastroThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              MOTIVOSAIDACIDADAO = 1
              DATAOBITO = 2
              NUMERODO = 3

              FIELDS = {
                MOTIVOSAIDACIDADAO => {:type => ::Thrift::Types::I64, :name => 'motivoSaidaCidadao', :optional => true},
                DATAOBITO => {:type => ::Thrift::Types::I64, :name => 'dataObito', :optional => true},
                NUMERODO => {:type => ::Thrift::Types::STRING, :name => 'numeroDO', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
              end

              ::Thrift::Struct.generate_accessors(self)
            end

            class CadastroIndividualThrift
              include ::Thrift::Struct, ::Thrift::Struct_Union
              CONDICOESDESAUDE = 1
              EMSITUACAODERUA = 3
              FICHAATUALIZADA = 4
              IDENTIFICACAOUSUARIOCIDADAO = 5
              INFORMACOESSOCIODEMOGRAFICAS = 6
              STATUSTERMORECUSACADASTROINDIVIDUALATENCAOBASICA = 7
              TPCDSORIGEM = 8
              UUID = 9
              UUIDFICHAORIGINADORA = 10
              UUIDCIDADAO = 11
              SAIDACIDADAOCADASTRO = 12
              HEADERTRANSPORT = 13
              STATUSCADASTROINDIVIDUALINATIVO = 14
              STATUSGERADOAUTOMATICAMENTE = 15

              FIELDS = {
                CONDICOESDESAUDE => {:type => ::Thrift::Types::STRUCT, :name => 'condicoesDeSaude', :class => ::Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CondicoesDeSaudeThrift, :optional => true},
                EMSITUACAODERUA => {:type => ::Thrift::Types::STRUCT, :name => 'emSituacaoDeRua', :class => ::Br::Gov::Saude::Esusab::Ras::Cadastroindividual::EmSituacaoDeRuaThrift, :optional => true},
                FICHAATUALIZADA => {:type => ::Thrift::Types::BOOL, :name => 'fichaAtualizada', :optional => true},
                IDENTIFICACAOUSUARIOCIDADAO => {:type => ::Thrift::Types::STRUCT, :name => 'identificacaoUsuarioCidadao', :class => ::Br::Gov::Saude::Esusab::Ras::Cadastroindividual::IdentificacaoUsuarioCidadaoThrift, :optional => true},
                INFORMACOESSOCIODEMOGRAFICAS => {:type => ::Thrift::Types::STRUCT, :name => 'informacoesSocioDemograficas', :class => ::Br::Gov::Saude::Esusab::Ras::Cadastroindividual::InformacoesSocioDemograficasThrift, :optional => true},
                STATUSTERMORECUSACADASTROINDIVIDUALATENCAOBASICA => {:type => ::Thrift::Types::BOOL, :name => 'statusTermoRecusaCadastroIndividualAtencaoBasica', :optional => true},
                TPCDSORIGEM => {:type => ::Thrift::Types::I32, :name => 'tpCdsOrigem', :optional => true},
                UUID => {:type => ::Thrift::Types::STRING, :name => 'uuid'},
                UUIDFICHAORIGINADORA => {:type => ::Thrift::Types::STRING, :name => 'uuidFichaOriginadora', :optional => true},
                UUIDCIDADAO => {:type => ::Thrift::Types::STRING, :name => 'uuidCidadao', :optional => true},
                SAIDACIDADAOCADASTRO => {:type => ::Thrift::Types::STRUCT, :name => 'saidaCidadaoCadastro', :class => ::Br::Gov::Saude::Esusab::Ras::Cadastroindividual::SaidaCidadaoCadastroThrift, :optional => true},
                HEADERTRANSPORT => {:type => ::Thrift::Types::STRUCT, :name => 'headerTransport', :class => ::Br::Gov::Saude::Esusab::Ras::Common::UnicaLotacaoHeaderThrift, :optional => true},
                STATUSCADASTROINDIVIDUALINATIVO => {:type => ::Thrift::Types::BOOL, :name => 'statusCadastroIndividualInativo', :optional => true},
                STATUSGERADOAUTOMATICAMENTE => {:type => ::Thrift::Types::BOOL, :name => 'statusGeradoAutomaticamente', :optional => true},
              }

              def struct_fields; FIELDS; end

              def validate
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field uuid is unset!') unless @uuid
              end

              ::Thrift::Struct.generate_accessors(self)
            end

          end
        end
      end
    end
  end
end