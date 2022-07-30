# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'pages#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :procedure_sheets
  resources :care_procedures
  resources :collective_calls
  resources :individual_calls
  resources :exam_results
  resources :forwardings
  resources :medicines
  resources :exams
  resources :problem_condition_evaluateds
  resources :collective_activity_sheets
  resources :participants
  resources :professionals
  resources :individual_registrations
  resources :patients
  resources :doctors
  resources :reports
  resources :addresses

  devise_for :users,
             controllers: {
               sessions: 'users/sessions', registrations: 'users/registrations'
             }

  #Custom routes
  get 'graphics/index'
  post '/notify_patient' => 'individual_registrations#notify_patient'

  get 'individual_registrations_search' => 'individual_registrations#search'
end
