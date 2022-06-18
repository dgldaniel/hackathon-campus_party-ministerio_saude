class CreateIndividualRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_registrations do |t|
      t.string :cns_cpf_cidadao
      t.string :cns_cpf_responsavel_familiar
      t.string :nome_completo
      t.date :data_nascimento
      t.string :sexo
      t.string :raca_cor
      t.string :etnia
      t.string :pis_pasep
      t.string :nome_completo_mae
      t.string :nome_completo_pai
      t.string :nacionalidade
      t.date :pais_nascimento
      t.string :data_naturalizacao
      t.string :municipio_uf_nascimento
      t.string :telefone_celular
      t.string :email
      t.string :relacao_parentesco_responsavel_familiar
      t.string :curso_elevado_frequenta_frequentou
      t.string :situacao_mercado_trabalho
      t.string :frequenta_cuidador_tradicional
      t.string :participa_grupo_comunitario
      t.string :possui_plano_saude_privado
      t.string :orientacao_sexual
      t.string :identidade_genero
      t.string :saida_cidadao_cadastro
      t.string :gestante
      t.string :peso
      t.string :fumante
      t.string :uso_alcool
      t.string :uso_outras_drogas
      t.string :hipertensao_arterial
      t.string :diabetes
      t.string :avc_derrame
      t.string :infarto
      t.string :hanseniase
      t.string :tuberculose
      t.string :tem_ou_teve_cancer
      t.string :alguma_internacao_ultimos_12_meses
      t.string :diagnostico_algum_problema_saude_mental_profissional_saude
      t.string :acamado
      t.string :domiciliado
      t.string :outras_praticas_integrativas_complementares
      t.string :situacao_rua
      t.string :recebe_algum_beneficio
      t.string :possui_referencia_familiar

      t.timestamps
    end
  end
end
