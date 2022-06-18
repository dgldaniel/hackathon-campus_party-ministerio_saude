# frozen_string_literal: true
class ApplicationController < ActionController::Base
  layout :layout_by_resource

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    user_session_path
  end

  private

  def layout_by_resource
    devise_controller? ? 'devise_layout' : 'application'
  end
end
