# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'dgldaniel@gmail.com', password: '123456', password_confirmation: '123456')

Doctor.create(full_name: Faker::Name.first_name, CRM: '123456', user_id: 1)

15.times do
  current_patient = Patient.create(full_name: Faker::Name.first_name,
                                   email: Faker::Internet.email,
                                   age: rand(18..90),
                                   gender: [0, 1].sample,
                                   phone: '991745677',
                                   doctor_id: 1
                                  )



  Report.create(patient_id: current_patient.id,
                hba1c: rand(0.065..0.079),
                ldc: rand(50..200),
                pa: rand(5000..20000),
                medical_adhesion: Faker::Boolean.boolean,
                algorithm_adherence: Faker::Boolean.boolean,
                use_AAS: Faker::Boolean.boolean,
                use_stain: Faker::Boolean.boolean,
                pains_feet_hands: Faker::Boolean.boolean,
                waist_measured_ratio: rand(0.0..1.0),
                microalbuminuria_evaluation: Faker::Boolean.boolean,
                blurred_vision: Faker::Boolean.boolean,
                periodontal_disease_evaluation: Faker::Boolean.boolean,
                depression_assessment: Faker::Boolean.boolean,
                presence_stroke_coronary_heart_disease: Faker::Boolean.boolean,
                influenza_vaccination: Faker::Boolean.boolean,
                h1n1_antipneumococcal: Faker::Boolean.boolean,
                participation_diabetes_nutritional_education_program: Faker::Boolean.boolean,
                smoker: Faker::Boolean.boolean
              )
end
