# frozen_string_literal: true
json.extract!(address, :id, :street, :number, :state, :city, :complement, :created_at, :updated_at)
json.url(address_url(address, format: :json))
