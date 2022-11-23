# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :authenticate_user!

  def individual_registrations
    @results = IndividualRegistration.where("cnsCidadao ILIKE ?", "%#{params[:search].downcase}%")
  end
end
