# frozen_string_literal: true
class Report < ApplicationRecord
  validates :hba1c, presence: true
  validates :ldc, presence: true
  validates :pa, presence: true
  validates :waist_measured_ratio, presence: true

  belongs_to :patient

  before_create :calculate_situation

  private

  def calculate_situation
    age_patient = patient.age
    hba1c = self.hba1c
    gender = patient.gender

    self.situation = 0

    # item a) domínio de metas terapêuticas(grau de controle da população diabética)

    if hba1c.between?(0.065, 0.07) && age_patient.between?(18, 60)
      self.situation += 0.0625
    elsif hba1c.between?(0.07, 0.079) && age_patient.between?(12, 60)
      self.situation += 0.0625
    elsif hba1c.between?(0.07, 0.079)
      self.situation += 0.0625
    end

    self.situation += 0.0625 if ldc > 100

    self.situation += 0.0625 if pa > 130 * 80

    self.situation += 0.0625 if medical_adhesion

    # item b) domínio de adesão dos provedores de saúde aos protocolos de tratamento

    self.situation += 0.083 if algorithm_adherence

    self.situation += 0.083 if use_AAS

    self.situation += 0.083 if use_stain

    # item c) domínio de adesão dos provedores de saúde aos protocolos de tratamento

    self.situation += 0.0357 if pains_feet_hands

    self.situation += 0.0357 if (waist_measured_ratio >= 0.85) && (gender == 1)

    self.situation += 0.0357 if (waist_measured_ratio >= 0.9) && (gender == 0)

    self.situation += 0.0357 if microalbuminuria_evaluation

    self.situation += 0.0357 if blurred_vision

    self.situation += 0.0357 if periodontal_disease_evaluation

    self.situation += 0.0357 if depression_assessment

    self.situation += 0.0357 if presence_stroke_coronary_heart_disease

    # item d) domínio de ações preventivas
    self.situation += 0.0625 if influenza_vaccination

    self.situation += 0.0625 if h1n1_antipneumococcal

    if participation_diabetes_nutritional_education_program
      self.situation += 0.0625
    end

    self.situation += 0.0625 if smoker

    puts "Pontuação: #{self.situation}"
  end
end
