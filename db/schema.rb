# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_10_191618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street", limit: 50
    t.integer "number"
    t.string "state", limit: 50
    t.string "city", limit: 50
    t.string "complement", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id"
    t.string "zip_code", limit: 15
    t.index ["patient_id"], name: "index_addresses_on_patient_id"
  end

  create_table "care_procedures", force: :cascade do |t|
    t.string "numProntuario"
    t.string "cnsCidadao"
    t.string "dtNascimento"
    t.integer "sexo"
    t.integer "localAtendimento"
    t.integer "turn"
    t.boolean "statusEscutaInicialOrientacao"
    t.string "procedimentos", default: [], array: true
    t.string "dataHoraInicialAtendimento"
    t.string "dataHoraFinalAtendimento"
    t.float "pesoAcompanhamentoNutricional"
    t.float "alturaAcompanhamentoNutricional"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "procedure_sheet_id"
    t.string "outrosSiaProcedimentos"
    t.index ["procedure_sheet_id"], name: "index_care_procedures_on_procedure_sheet_id"
  end

  create_table "collective_activity_sheets", force: :cascade do |t|
    t.uuid "uuidFicha"
    t.uuid "inep"
    t.integer "numParticipantes"
    t.integer "numAvaliacoesAlterada"
    t.integer "atividadeTipo"
    t.string "publicoAlvo", default: [], array: true
    t.integer "tbCdsOrigem"
    t.string "procedimento"
    t.integer "turno"
    t.boolean "pseEducacao"
    t.boolean "pseSaude"
    t.string "temasParaSaude", default: [], array: true
    t.string "praticasEmSaude", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collective_calls", force: :cascade do |t|
    t.uuid "uuidFicha"
    t.string "inep"
    t.integer "numParticipantes"
    t.integer "numAvaliacoesAlteradas"
    t.integer "atividadeTipo"
    t.string "publicoAlvo", default: [], array: true
    t.integer "tbCdsOrigem"
    t.string "procedimento"
    t.integer "turno"
    t.boolean "pseEducacao"
    t.boolean "pseSaude"
    t.string "temasParaSaude", default: [], array: true
    t.string "praticasEmSaude", default: [], array: true
    t.bigint "participants_id", null: false
    t.bigint "professionals_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participants_id"], name: "index_collective_calls_on_participants_id"
    t.index ["professionals_id"], name: "index_collective_calls_on_professionals_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "profissionalCNS", limit: 15, null: false
    t.string "cboCodigo_2002", null: false
    t.string "cnes", limit: 7, null: false
    t.string "ine", limit: 10
    t.datetime "dataAtendimento", null: false
    t.string "codigoIbgeMunicipio", limit: 15, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.string "exame"
    t.datetime "dataSolicitacao"
    t.datetime "dataRealizacao"
    t.datetime "dataResultado"
    t.integer "tipoResultado"
    t.integer "valorResultado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "individual_call_id"
    t.index ["individual_call_id"], name: "index_exam_results_on_individual_call_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "codigoExame"
    t.string "solicitadoAvaliado", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "individual_call_id"
    t.index ["individual_call_id"], name: "index_exams_on_individual_call_id"
  end

  create_table "families", force: :cascade do |t|
    t.datetime "dataNascimentoResponsavel"
    t.string "numeroCnsResponsavel"
    t.integer "numeroMembrosFamilia"
    t.string "numeroProntuario"
    t.integer "rendaFamiliar"
    t.datetime "resideDesde"
    t.boolean "stMudanca"
    t.bigint "household_registration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_registration_id"], name: "index_families_on_household_registration_id"
  end

  create_table "forwardings", force: :cascade do |t|
    t.integer "especialidade"
    t.string "hipoteseDiagnosticoCid10"
    t.integer "classificacaoRisco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "individual_call_id"
    t.index ["individual_call_id"], name: "index_forwardings_on_individual_call_id"
  end

  create_table "household_registrations", force: :cascade do |t|
    t.integer "animaisNoDomicilio", default: [], array: true
    t.boolean "fichaAtualizada"
    t.string "quantosAnimaisNoDomicilio"
    t.boolean "stAnimaisNoDomicilio"
    t.string "statusTermoRecusaCadatroDomiciliarAtencaoBasica"
    t.integer "tpCdsOrigem"
    t.uuid "uuid"
    t.uuid "uuidFichaOriginadora"
    t.string "bairro"
    t.string "cep"
    t.string "codigoIbgeMunicipio"
    t.string "complemento"
    t.string "nomeLogradouro"
    t.string "numero"
    t.string "numeroDneUf"
    t.string "telReferencial"
    t.string "telResidencial"
    t.string "tipoLogradouroNumeroDne"
    t.boolean "stSemNumero"
    t.integer "abastecimentoAgua"
    t.integer "areaProducaoRural"
    t.integer "destinoLixo"
    t.integer "formaEscoamentoBanheiro"
    t.integer "localizacao"
    t.integer "materialPredominanteParedesExtDomicilio"
    t.string "nuComodos"
    t.integer "nuMoradores"
    t.integer "situacaoMoradiaPosseTerra"
    t.boolean "stDiponibilidadeEnergiaeletrica"
    t.integer "tipoAcessoDomicilio"
    t.integer "tipoDomicilio"
    t.integer "tratamentoAguaDomicilio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individual_calls", force: :cascade do |t|
    t.string "numeroProntuario"
    t.string "cnsCidadao"
    t.datetime "dataNascimento"
    t.integer "localDeAtendimento"
    t.integer "sexo"
    t.integer "turno"
    t.integer "tipoAtendimento"
    t.float "pesoAcompanhamentoNutricional"
    t.float "alturaAcompanhamentoNutricional"
    t.integer "aleitamentoMaterno"
    t.datetime "dumDaGestante"
    t.integer "idadeGestacional"
    t.integer "atencaoDomiciliarModalidade"
    t.boolean "vacinaEmDia"
    t.boolean "ficouEmObservacao"
    t.integer "nasfs"
    t.string "condutas", default: [], array: true
    t.boolean "stGravidezPlanejada"
    t.integer "nuGestasPrevias"
    t.integer "nuPartos"
    t.integer "racionalidadeSaude"
    t.float "perimetroCefalico"
    t.datetime "dataHoraInicialAtendimento"
    t.datetime "dataHoraFinalAtendimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pic"
    t.string "examesSolicitados", default: [], array: true
    t.string "examesAvaliados", default: [], array: true
  end

  create_table "individual_registrations", force: :cascade do |t|
    t.boolean "statusTemDoencaRespiratoria"
    t.boolean "statusUsaOutrasPraticasIntegrativasOuComplementares"
    t.boolean "statusTemTeveDoencasRins"
    t.boolean "statusTeveDoencaCardiaca"
    t.boolean "statusTeveInternadoEm12Meses"
    t.boolean "statusUsaPlantasMedicinais"
    t.string "grauParentescoFamiliarFrequentado", limit: 100
    t.string "nomeSocial", limit: 70
    t.integer "higienePessoalSituacaoRua", default: [], array: true
    t.integer "origemAlimentoSituacaoRua", default: [], array: true
    t.string "outraInstituicaoQueAcompanha", limit: 100
    t.integer "quantidadeAlimentacoesAoDiaSituacaoRua"
    t.boolean "statusAcompanhadoPorOutraInstituicao"
    t.boolean "statusTemAcessoHigienePessoalSituacaoRua"
    t.boolean "statusVisitaFamiliarFrequentemente"
    t.integer "tempoSituacaoRua"
    t.string "codigoIbgeMunicipioNascimento", limit: 7
    t.boolean "desconheceNomeMae"
    t.boolean "statusEhResponsavel"
    t.string "nomePaiCidadao", limit: 70
    t.boolean "desconheceNomePai"
    t.date "dtNaturalizacao"
    t.date "dtEntradaBrasil"
    t.string "microArea", limit: 2
    t.boolean "stForaArea"
    t.integer "deficienciasCidadao", default: [], array: true
    t.integer "responsavelPorCrianca", default: [], array: true
    t.integer "grauInstrucaoCidadao"
    t.string "ocupacaoCodigoCbo2002"
    t.string "portariaNaturalizacao", limit: 16
    t.boolean "statusFrequentaEscola"
    t.boolean "statusMembroPovoComunidadeTradicional"
    t.boolean "statusDesejaInformarIdentidadeGenero"
    t.string "coPovoComunidadeTradicional"
    t.boolean "statusTermoRecusaCadastroIndividualAtencaoBasica"
    t.uuid "uuid"
    t.uuid "uuidFichaOriginadora"
    t.string "profissionalCNS"
    t.string "cboCodigo_2002"
    t.string "cnes"
    t.string "ine"
    t.datetime "dataAtendimento"
    t.string "codigoIbgeMunicipio"
    t.uuid "uuidDadoSerializado"
    t.integer "tipoDadoSerializado"
    t.string "codIbge"
    t.string "cnesDadoSerializado"
    t.string "ineDadoSerializado"
    t.integer "numLote"
    t.boolean "fichaAtualizada"
    t.boolean "motivoSaidaCidadao"
    t.integer "tpCdsOrigem", null: false
    t.string "descricaoCausaInternacaoEm12Meses", limit: 100
    t.string "descricaoOutraCondicao1", limit: 100
    t.string "descricaoOutraCondicao2", limit: 100
    t.string "descricaoOutraCondicao3", limit: 100
    t.string "descricaoPlantasMedicinaisUsadas", limit: 100
    t.integer "doencaCardiaca", default: [], array: true
    t.integer "doencaRespiratoria", default: [], array: true
    t.integer "doencaRins", default: [], array: true
    t.string "maternidadeDeReferencia", limit: 100
    t.integer "situacaoPeso"
    t.boolean "statusEhDependenteAlcool"
    t.boolean "statusEhDependenteOutrasDrogas"
    t.boolean "statusEhFumante"
    t.boolean "statusEhGestante"
    t.boolean "statusEstaAcamado"
    t.boolean "statusEstaDomiciliado"
    t.boolean "statusTemDiabetes"
    t.boolean "statusTemHanseniase"
    t.boolean "statusTemHipertensaoArterial"
    t.boolean "statusTemTeveCancer"
    t.boolean "statusTemTuberculose"
    t.boolean "statusTeveAvcDerrame"
    t.boolean "statusTeveInfarto"
    t.boolean "statusDiagnosticoMental"
    t.boolean "statusPossuiReferenciaFamiliar"
    t.boolean "statusRecebeBeneficio"
    t.boolean "statusSituacaoRua"
    t.date "dataNascimentoCidadao", null: false
    t.string "emailCidadao", limit: 100
    t.integer "nacionalidadeCidadao", null: false
    t.string "nomeCidadao", limit: 70, null: false
    t.string "nomeMaeCidadao", limit: 70
    t.string "cpfCidadao", limit: 11
    t.string "cpfResponsavelFamiliar", limit: 11
    t.string "cnsCidadao", limit: 15
    t.string "cnsResponsavelFamiliar", limit: 15
    t.string "telefoneCelular", limit: 11
    t.string "numeroNisPisPasep", limit: 11
    t.integer "paisNascimento"
    t.integer "racaCorCidadao", null: false
    t.integer "sexoCidadao", null: false
    t.integer "etnia"
    t.integer "orientacaoSexualCidadao"
    t.integer "relacaoParentescoCidadao"
    t.integer "situacaoMercadoTrabalhoCidadao"
    t.boolean "statusDesejaInformarOrientacaoSexual"
    t.boolean "statusFrequentaBenzedeira"
    t.boolean "statusParticipaGrupoComunitario"
    t.boolean "statusPossuiPlanoSaudePrivado"
    t.boolean "statusTemAlgumaDeficiencia"
    t.integer "identidadeGeneroCidadao"
    t.date "dataObito"
    t.string "numeroDO", limit: 9
    t.boolean "statusCadastroIndividualInativo"
    t.boolean "statusGeradoAutomaticamente"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string "codigoCatmat"
    t.integer "viaAdministracao"
    t.string "dose"
    t.boolean "doseUnica"
    t.boolean "usoContinuo"
    t.integer "doseFrequenciaTipo"
    t.string "doseFrequencia"
    t.integer "doseFrequenciaQuantidade"
    t.integer "doseFrequenciaUnidadeMedida"
    t.string "dtInicioTratamento"
    t.integer "duracaoTratamento"
    t.integer "duracaoTratamentoMedida"
    t.integer "quantidadeReceitada"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "individual_call_id"
    t.index ["individual_call_id"], name: "index_medicines_on_individual_call_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "cnsParticipante"
    t.datetime "dataNascimento"
    t.boolean "avaliacaoAlterada"
    t.boolean "cessouHabitoFumar"
    t.boolean "abandonouGrupo"
    t.integer "sexo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collective_activity_sheet_id"
    t.index ["collective_activity_sheet_id"], name: "index_participants_on_collective_activity_sheet_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", limit: 50
    t.string "full_name", limit: 50
    t.integer "age"
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone", limit: 15
    t.integer "gender"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "problem_condition_evaluateds", force: :cascade do |t|
    t.string "ciaps", default: [], array: true
    t.string "outroCiap1", default: [], array: true
    t.string "cid10"
    t.string "cid10_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "individual_call_id"
    t.index ["individual_call_id"], name: "index_problem_condition_evaluateds_on_individual_call_id"
  end

  create_table "procedure_sheets", force: :cascade do |t|
    t.uuid "uuidFicha"
    t.integer "tpCdsOrigem"
    t.integer "numTotalAfericaoPa"
    t.integer "numTotalAfericaoTemperatura"
    t.integer "numTotalCurativoSimples"
    t.integer "numTotalColetaMaterialParaExameLaboratorial"
    t.integer "numTotalGlicemiaCapilar"
    t.integer "numTotalMedicaoAltura"
    t.integer "numTotalMedicaoPeso"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string "cnsProfissional"
    t.string "codigoCbo2002"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collective_activity_sheet_id"
    t.index ["collective_activity_sheet_id"], name: "index_professionals_on_collective_activity_sheet_id"
  end

  create_table "reports", force: :cascade do |t|
    t.float "hba1c"
    t.float "ldc"
    t.float "pa"
    t.boolean "medical_adhesion", default: false
    t.boolean "algorithm_adherence", default: false
    t.boolean "use_AAS", default: false
    t.boolean "use_stain", default: false
    t.boolean "pains_feet_hands", default: false
    t.float "waist_measured_ratio"
    t.boolean "microalbuminuria_evaluation", default: false
    t.boolean "blurred_vision", default: false
    t.boolean "periodontal_disease_evaluation", default: false
    t.boolean "depression_assessment", default: false
    t.boolean "presence_stroke_coronary_heart_disease", default: false
    t.boolean "influenza_vaccination", default: false
    t.boolean "h1n1_antipneumococcal", default: false
    t.boolean "participation_diabetes_nutritional_education_program", default: false
    t.boolean "smoker", default: false
    t.float "situation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_reports_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 50, default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "collective_calls", "participants", column: "participants_id"
  add_foreign_key "collective_calls", "professionals", column: "professionals_id"
  add_foreign_key "families", "household_registrations"
  add_foreign_key "patients", "doctors"
end
