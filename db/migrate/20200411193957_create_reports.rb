# frozen_string_literal: true
class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table(:reports) do |t|
      t.float(:hba1c)
      t.float(:ldc)
      t.float(:pa)
      t.boolean(:medical_adhesion, default: false)
      t.boolean(:algorithm_adherence, default: false)
      t.boolean(:use_AAS, default: false)
      t.boolean(:use_stain, default: false)
      t.boolean(:pains_feet_hands, default: false)
      t.float(:waist_measured_ratio)
      t.boolean(:microalbuminuria_evaluation, default: false)
      t.boolean(:blurred_vision, default: false)
      t.boolean(:periodontal_disease_evaluation, default: false)
      t.boolean(:depression_assessment, default: false)
      t.boolean(:presence_stroke_coronary_heart_disease, default: false)
      t.boolean(:influenza_vaccination, default: false)
      t.boolean(:h1n1_antipneumococcal, default: false)
      t.boolean(:participation_diabetes_nutritional_education_program, default: false)
      t.boolean(:smoker, default: false)
      t.float(:situation)

      t.timestamps
    end
  end
end
