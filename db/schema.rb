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

ActiveRecord::Schema.define(version: 2022_06_15_002507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "doctors", force: :cascade do |t|
    t.string "full_name", limit: 50
    t.string "CRM", limit: 15
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "individual_registrations", force: :cascade do |t|
    t.string "cns_cpf_cidadao"
    t.string "cns_cpf_responsavel_familiar"
    t.string "nome_completo"
    t.date "data_nascimento"
    t.string "sexo"
    t.string "raca_cor"
    t.string "etnia"
    t.string "pis_pasep"
    t.string "nome_completo_mae"
    t.string "nome_completo_pai"
    t.string "nacionalidade"
    t.date "pais_nascimento"
    t.string "data_naturalizacao"
    t.string "municipio_uf_nascimento"
    t.string "telefone_celular"
    t.string "email"
    t.string "relacao_parentesco_responsavel_familiar"
    t.string "curso_elevado_frequenta_frequentou"
    t.string "situacao_mercado_trabalho"
    t.string "frequenta_cuidador_tradicional"
    t.string "participa_grupo_comunitario"
    t.string "possui_plano_saude_privado"
    t.string "orientacao_sexual"
    t.string "identidade_genero"
    t.string "saida_cidadao_cadastro"
    t.string "gestante"
    t.string "peso"
    t.string "fumante"
    t.string "uso_alcool"
    t.string "uso_outras_drogas"
    t.string "hipertensao_arterial"
    t.string "diabetes"
    t.string "avc_derrame"
    t.string "infarto"
    t.string "hanseniase"
    t.string "tuberculose"
    t.string "tem_ou_teve_cancer"
    t.string "alguma_internacao_ultimos_12_meses"
    t.string "diagnostico_algum_problema_saude_mental_profissional_saude"
    t.string "acamado"
    t.string "domiciliado"
    t.string "outras_praticas_integrativas_complementares"
    t.string "situacao_rua"
    t.string "recebe_algum_beneficio"
    t.string "possui_referencia_familiar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dor_pernas"
    t.float "hem_glicada"
    t.string "dentista_semestre"
    t.string "vacinou_h1n1"
    t.string "vacinou_covid"
    t.string "consulta_cardiologista_ano"
    t.string "classica_auto_cuidado"
    t.string "entende_importancia_alimentacao_diabetes"
    t.string "consegue_alimentacao_saudavel"
    t.string "consultou_psicologo"
    t.string "altura"
    t.string "imc"
    t.string "peadesao_medicamento"
    t.string "autismo_leve"
    t.string "ciap_cid", default: [], array: true
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

  add_foreign_key "patients", "doctors"
end
