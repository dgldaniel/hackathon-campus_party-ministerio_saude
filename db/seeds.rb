# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'dgldaniel@gmail.com', password: '123456', password_confirmation: '123456')

avatar_path = Rails.root.join('app', 'assets', 'images', 'avatar.jpg')

any_doctor = Doctor.create(profissionalCNS: '898001161481488',
              name: 'Daniel Douglas',
              cboCodigo_2002: '515105',
              cnes: '0019615',
              ine: '0000471828',
              dataAtendimento: Time.now,
              codigoIbgeMunicipio: '4205407',
              checked_exists: true,
              user_id: 1)

any_doctor.avatar.attach(
  io:  File.open(avatar_path),
  filename: 'avatar.jpg'
)


