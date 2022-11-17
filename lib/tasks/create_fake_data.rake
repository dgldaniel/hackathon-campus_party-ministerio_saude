# frozen_string_literal: true
namespace :create_fake_data do
  desc "Create fake data"

  task registrations: :environment do
    cad_individual_fields_path = Rails.root.join('lib', 'esus', 'models', 'cadastro_individual', 'cad_individual_seeds.yml')
    cad_domiciliar_fields_path = Rails.root.join('lib', 'esus', 'models', 'cadastro_domiciliar', 'cad_domiciliar_seeds.yml')

    cad_individual_records = YAML.load(File.read(cad_individual_fields_path))
    cad_domiciliar_records = YAML.load(File.read(cad_domiciliar_fields_path))

    IndividualRegistration.create_from_hash(cad_individual_records)
    HouseholdRegistration.create_from_hash(cad_domiciliar_records)
  end
end

