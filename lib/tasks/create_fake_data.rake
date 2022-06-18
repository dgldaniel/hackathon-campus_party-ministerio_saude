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
      ciap_cid: Faker::Alphanumeric.alpha(number: 10),
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
      relacao_parentesco_responsavel_familiar:  ['Cônjuge/Companheiro', 'Filho(a)','Enteado(a)', 'Neto(a)/Bisneto(a)', 'Pai/Mãe','Sogro(a)', 'Irmão/Irmã', 'Genro/Nora', 'Outro parente', 'Não parente'].sample,
      curso_elevado_frequenta_frequentou: ['Creche','Pré-escola (exceto CA)','Classe de Alfabetização - CA','Ensino Fundamental 1ª a 4ª séries','Ensino Fundamental 5ª a 8ª séries','Ensino Fundamental Completo','Ensino Fundamental Especial','Ensino Fundamental EJA - séries iniciais', 'Ensino Fundamental EJA - séries finais (Supletivo 5ª a 8ª)','Ensino Médio, Médio 2º Ciclo (Científico, Técnico etc.)','Ensino Médio Especial',  'Ensino Médio EJA (Supletivo)', 'Superior, Aperfeiçoamento, Especialização, Mestrado, Doutorado','Alfabetização para Adultos (Mobral etc.)', 'Nenhum'].sample,
      situacao_mercado_trabalho: ['Empregador', 'Assalariado com carteira de trabalho', 'Assalariado sem carteira de trabalho', 'Autônomo com previdência social', 'Autônomo sem previdência social', 'Aposentado/Pensionista', 'Desempregado','Não trabalha', 'Servidor público/militar', 'Outro'].sample,
      frequenta_cuidador_tradicional:  ['Sim', 'Não'].sample,
      participa_grupo_comunitario:  ['Sim', 'Não'].sample,
      possui_plano_saude_privado:  ['Sim', 'Não'].sample,
      orientacao_sexual:  ['Não', 'Heterossexual', 'Bissexual', 'Homossexual (gay / lésbica)', 'Outra'].sample,
      identidade_genero:  ['Não','Homem transexual','Travesti','Mulher transexual','Outro'].sample,
      saida_cidadao_cadastro:  ['Mudança de território','Óbito'].sample,
      gestante: ['Sim', 'Não'].sample,
      peso:  ['Abaixo do Peso', 'Peso Adequado','Acima do Peso'].sample,
      fumante: ['Sim', 'Não'].sample ,
      uso_alcool:  ['Sim', 'Não'].sample,
      uso_outras_drogas: ['Sim', 'Não'].sample ,
      hipertensao_arterial:  ['Sim', 'Não'].sample,
      diabetes:  manager_city_to_diabetes(city_name, index),
      avc_derrame: ['Sim', 'Não'].sample ,
      infarto: ['Sim', 'Não'].sample ,
      hanseniase: ['Sim', 'Não'].sample ,
      tuberculose:  ['Sim', 'Não'].sample,
      tem_ou_teve_cancer:  ['Sim', 'Não'].sample,
      alguma_internacao_ultimos_12_meses:  ['Não', Faker::Lorem.word].sample,
      diagnostico_algum_problema_saude_mental_profissional_saude:  ['Sim', 'Não'].sample,
      acamado:  ['Sim', 'Não'].sample,
      domiciliado: ['Sim', 'Não'].sample,
      outras_praticas_integrativas_complementares:  ['Sim', 'Não'].sample,
      situacao_rua:  ['Não', '< 6 meses', '6 a 12 meses', '1 a 5 anos', '> 5 anos'].sample,
      recebe_algum_beneficio:  ['Sim', 'Não'].sample,
      possui_referencia_familiar:  ['Não', '1 vez', '2 ou 3 vezes', 'mais de 3 vezes'].sample,
      dor_pernas:  ['Sim', 'Não'].sample,
      hem_glicada:  (1..7).to_a.sample,
      dentista_semestre: ['Sim', 'Não'].sample,
      vacinou_h1n1:  ['Sim', 'Não'].sample,
      vacinou_covid:  ['Sim', 'Não'].sample,
      consulta_cardiologista_ano:  ['Sim', 'Não'].sample,
      classica_auto_cuidado: Faker::Lorem.word,
      entende_importancia_alimentacao_diabetes:  ['Sim', 'Não'].sample,
      consegue_alimentacao_saudavel:  ['Sim', 'Não'].sample,
      consultou_psicologo:  ['Sim', 'Não'].sample,
      altura:  (1..2).to_a.sample,
      imc: (17..41).to_a.sample,
      peadesao_medicamento: Faker::Lorem.word,
      autismo_leve: ['Sim', 'Não'].sample
    }
  end

  def manager_city_to_diabetes(city_name, index)
    case city_name
    when 'Cidade A'
      index <= 300 ? 'Sim' : 'Não'
    when 'Cidade B'
      index >= 300 ? 'Sim' : 'Não'
    when 'Cidade C'
      ['Sim', 'Não'].sample
    end
  end
