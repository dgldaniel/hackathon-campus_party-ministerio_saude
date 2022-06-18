class GraphicsController < ApplicationController
  def index
    @diabetes_sim_cidade_A = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade A', diabetes: 'Sim' }).count
    @diabetes_nao_cidade_A = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade A', diabetes: 'Não' }).count

    @diabetes_sim_cidade_B = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade B', diabetes: 'Sim' }).count
    @diabetes_nao_cidade_B = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade B', diabetes: 'Não' }).count

    @diabetes_sim_cidade_C = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade C', diabetes: 'Sim' }).count
    @diabetes_nao_cidade_C = IndividualRegistration.where({ municipio_uf_nascimento: 'Cidade C', diabetes: 'Não' }).count
  end
end
