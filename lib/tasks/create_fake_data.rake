namespace :create_fake_data do
  desc "Create fake data"
  task ind_reg: :environment do
    if Rails.env.prodution?
      puts "Denined"
    else
      3000.times do |i|
        index = i + 1

        new_ind_reg_1 = create_to_database('Cidade A', index)

        IndividualRegistration.create! new_ind_reg_1
      end

      3000.times do |i|
        index = i + 1

        new_ind_reg_2 = create_to_database('Cidade B', index)

        IndividualRegistration.create! new_ind_reg_2
      end

      3000.times do |i|
        index = i + 1

        new_ind_reg_3 = create_to_database('Cidade C', index)

        IndividualRegistration.create! new_ind_reg_3
      end
    end
  end

  desc "TODO 2"
  task ind_reg_real: :environment do

    new_ind_reg_1 = create_to_database('Cidade A', 1, 'Daniel', 'danieldouglas26@gmail.com', '98991845677')
    new_ind_reg_2 = create_to_database('Cidade A', 1, 'Aurea', 'aureaceleste@gmail.com', '98981956516')
    new_ind_reg_3 = create_to_database('Cidade A', 1, 'Neilson', 'neilsonmmousinho@gmail.com', '98981628655')

    IndividualRegistration.create!([new_ind_reg_1, new_ind_reg_2, new_ind_reg_3])
  end
end

  private

  def create_to_database(city_name, index, nome = nil, email = nil, phone = nil)
    {
      ciap_cid: ['K75', 'T89', 'F84.5', 'F20.0'].sample,
      cns_cpf_cidadao: Faker::CPF.pretty,
      cns_cpf_responsavel_familiar: Faker::CPF.pretty,
      nome_completo: nome.nil? ? Faker::Name.name : nome,
      data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 65),
      sexo: ['Masculino', 'Feminino'].sample,
      raca_cor:  ['Branca', 'Preta', 'Parda', 'Amarela', 'Indigena'].sample,
      etnia: Faker::Lorem.word,
      pis_pasep:  Faker::DrivingLicence.usa_driving_licence,
      nome_completo_mae: Faker::Name.female_first_name,
      nome_completo_pai: Faker::Name.male_first_name,
      nacionalidade:  ['Brasileira', 'Naturalizado', 'Estrangeiro'].sample,
      pais_nascimento:  'Brasil',
      data_naturalizacao: Faker::Date.between(from: '1960-01-01', to: '1990-12-31'),
      municipio_uf_nascimento:  city_name,
      telefone_celular: phone.nil? ? Faker::PhoneNumber.cell_phone : phone,
      email: email.nil? ? Faker::Internet.free_email : email,
      relacao_parentesco_responsavel_familiar:  ['C??njuge/Companheiro', 'Filho(a)','Enteado(a)', 'Neto(a)/Bisneto(a)', 'Pai/M??e','Sogro(a)', 'Irm??o/Irm??', 'Genro/Nora', 'Outro parente', 'N??o parente'].sample,
      curso_elevado_frequenta_frequentou: ['Creche','Pr??-escola (exceto CA)','Classe de Alfabetiza????o - CA','Ensino Fundamental 1?? a 4?? s??ries','Ensino Fundamental 5?? a 8?? s??ries','Ensino Fundamental Completo','Ensino Fundamental Especial','Ensino Fundamental EJA - s??ries iniciais', 'Ensino Fundamental EJA - s??ries finais (Supletivo 5?? a 8??)','Ensino M??dio, M??dio 2?? Ciclo (Cient??fico, T??cnico etc.)','Ensino M??dio Especial',  'Ensino M??dio EJA (Supletivo)', 'Superior, Aperfei??oamento, Especializa????o, Mestrado, Doutorado','Alfabetiza????o para Adultos (Mobral etc.)', 'Nenhum'].sample,
      situacao_mercado_trabalho: ['Empregador', 'Assalariado com carteira de trabalho', 'Assalariado sem carteira de trabalho', 'Aut??nomo com previd??ncia social', 'Aut??nomo sem previd??ncia social', 'Aposentado/Pensionista', 'Desempregado','N??o trabalha', 'Servidor p??blico/militar', 'Outro'].sample,
      frequenta_cuidador_tradicional:  ['Sim', 'N??o'].sample,
      participa_grupo_comunitario:  ['Sim', 'N??o'].sample,
      possui_plano_saude_privado:  ['Sim', 'N??o'].sample,
      orientacao_sexual:  ['N??o', 'Heterossexual', 'Bissexual', 'Homossexual (gay / l??sbica)', 'Outra'].sample,
      identidade_genero:  ['N??o','Homem transexual','Travesti','Mulher transexual','Outro'].sample,
      saida_cidadao_cadastro:  ['Mudan??a de territ??rio','??bito'].sample,
      gestante: ['Sim', 'N??o'].sample,
      peso:  ['Abaixo do Peso', 'Peso Adequado','Acima do Peso'].sample,
      fumante: ['Sim', 'N??o'].sample ,
      uso_alcool:  ['Sim', 'N??o'].sample,
      uso_outras_drogas: ['Sim', 'N??o'].sample ,
      hipertensao_arterial:  ['Sim', 'N??o'].sample,
      diabetes:  manager_city_to_diabetes(city_name, index),
      avc_derrame: ['Sim', 'N??o'].sample ,
      infarto: ['Sim', 'N??o'].sample ,
      hanseniase: ['Sim', 'N??o'].sample ,
      tuberculose:  ['Sim', 'N??o'].sample,
      tem_ou_teve_cancer:  ['Sim', 'N??o'].sample,
      alguma_internacao_ultimos_12_meses:  ['N??o', Faker::Lorem.word].sample,
      diagnostico_algum_problema_saude_mental_profissional_saude:  ['Sim', 'N??o'].sample,
      acamado:  ['Sim', 'N??o'].sample,
      domiciliado: ['Sim', 'N??o'].sample,
      outras_praticas_integrativas_complementares:  ['Sim', 'N??o'].sample,
      situacao_rua:  ['N??o', '< 6 meses', '6 a 12 meses', '1 a 5 anos', '> 5 anos'].sample,
      recebe_algum_beneficio:  ['Sim', 'N??o'].sample,
      possui_referencia_familiar:  ['N??o', '1 vez', '2 ou 3 vezes', 'mais de 3 vezes'].sample,
      dor_pernas:  ['Sim', 'N??o'].sample,
      hem_glicada:  (1..7).to_a.sample,
      dentista_semestre: ['Sim', 'N??o'].sample,
      vacinou_h1n1:  ['Sim', 'N??o'].sample,
      vacinou_covid:  ['Sim', 'N??o'].sample,
      consulta_cardiologista_ano:  ['Sim', 'N??o'].sample,
      classica_auto_cuidado: Faker::Lorem.word,
      entende_importancia_alimentacao_diabetes:  ['Sim', 'N??o'].sample,
      consegue_alimentacao_saudavel:  ['Sim', 'N??o'].sample,
      consultou_psicologo:  ['Sim', 'N??o'].sample,
      altura:  (1..2).to_a.sample,
      imc: (17..41).to_a.sample,
      peadesao_medicamento: Faker::Lorem.word,
      autismo_leve: ['Sim', 'N??o'].sample
    }
  end

  def manager_city_to_diabetes(city_name, index)
    case city_name
    when 'Cidade A'
      index <= 300 ? 'Sim' : 'N??o'
    when 'Cidade B'
      index >= 300 ? 'Sim' : 'N??o'
    when 'Cidade C'
      ['Sim', 'N??o'].sample
    end
  end
