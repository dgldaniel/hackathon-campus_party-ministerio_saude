require "application_system_test_case"

class MedicinesTest < ApplicationSystemTestCase
  setup do
    @medicine = medicines(:one)
  end

  test "visiting the index" do
    visit medicines_url
    assert_selector "h1", text: "Medicines"
  end

  test "creating a Medicine" do
    visit medicines_url
    click_on "New Medicine"

    fill_in "Codigocatmat", with: @medicine.codigoCatmat
    fill_in "Dose", with: @medicine.dose
    fill_in "Dosefrequencia", with: @medicine.doseFrequencia
    fill_in "Dosefrequenciaquantidade", with: @medicine.doseFrequenciaQuantidade
    fill_in "Dosefrequenciatipo", with: @medicine.doseFrequenciaTipo
    fill_in "Dosefrequenciaunidademedida", with: @medicine.doseFrequenciaUnidadeMedida
    check "Doseunica" if @medicine.doseUnica
    fill_in "Dtiniciotratamento", with: @medicine.dtInicioTratamento
    fill_in "Duracaotratamento", with: @medicine.duracaoTratamento
    fill_in "Duracaotratamentomedida", with: @medicine.duracaoTratamentoMedida
    fill_in "Quantidadereceitada", with: @medicine.quantidadeReceitada
    check "Usocontinuo" if @medicine.usoContinuo
    fill_in "Viaadministracao", with: @medicine.viaAdministracao
    click_on "Create Medicine"

    assert_text "Medicine was successfully created"
    click_on "Back"
  end

  test "updating a Medicine" do
    visit medicines_url
    click_on "Edit", match: :first

    fill_in "Codigocatmat", with: @medicine.codigoCatmat
    fill_in "Dose", with: @medicine.dose
    fill_in "Dosefrequencia", with: @medicine.doseFrequencia
    fill_in "Dosefrequenciaquantidade", with: @medicine.doseFrequenciaQuantidade
    fill_in "Dosefrequenciatipo", with: @medicine.doseFrequenciaTipo
    fill_in "Dosefrequenciaunidademedida", with: @medicine.doseFrequenciaUnidadeMedida
    check "Doseunica" if @medicine.doseUnica
    fill_in "Dtiniciotratamento", with: @medicine.dtInicioTratamento
    fill_in "Duracaotratamento", with: @medicine.duracaoTratamento
    fill_in "Duracaotratamentomedida", with: @medicine.duracaoTratamentoMedida
    fill_in "Quantidadereceitada", with: @medicine.quantidadeReceitada
    check "Usocontinuo" if @medicine.usoContinuo
    fill_in "Viaadministracao", with: @medicine.viaAdministracao
    click_on "Update Medicine"

    assert_text "Medicine was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicine" do
    visit medicines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicine was successfully destroyed"
  end
end
