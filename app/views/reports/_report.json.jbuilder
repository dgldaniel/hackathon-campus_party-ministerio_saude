# frozen_string_literal: true
json.extract!(report, :id, :hba1c, :ldc, :pa, :medical_adhesion, :algorithm_adherence, :use_AAS, :use_stain, :pains_feet_hands, :waist_measured_ratio, :microalbuminuria_evaluation, :blurred_vision, :periodontal_disease_evaluation, :depression_assessment, :presence_stroke_coronary_heart_disease, :influenza_vaccination, :h1n1_antipneumococcal, :participation_diabetes_nutritional_education_program, :smoker, :situation, :created_at, :updated_at)
json.url(report_url(report, format: :json))
