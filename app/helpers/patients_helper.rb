# frozen_string_literal: true
module PatientsHelper
  def select_value_approppriate
    params[:situation_options].blank? ? '' : params[:situation_options]
  end
end
