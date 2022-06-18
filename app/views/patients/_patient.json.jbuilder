# frozen_string_literal: true
json.extract!(patient, :id, :email, :full_name, :age, :address_id, :information_id, :created_at, :updated_at)
json.url(patient_url(patient, format: :json))
