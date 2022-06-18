# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :patients
  resources :doctors
  resources :reports
  resources :addresses
  resources :individual_registrations

  devise_for :users,
             controllers: {
               sessions: 'users/sessions', registrations: 'users/registrations'
             }

  #Custom routes
  root to: 'individual_registrations#index'

  get 'graphics/index'
  post '/notify_patient' => 'individual_registrations#notify_patient'
end
