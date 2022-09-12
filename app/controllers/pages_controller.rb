# frozen_string_literal: true
class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index upload_esus_files handle_upload_esus_files]

  def index
  end

  def upload_esus_files
  end

  def handle_upload_esus_files
    if params[:archive].present?
      DeserializeEsusJob.perform_now(params[:archive], 'Cadastro Individual')
    end
  end
end
