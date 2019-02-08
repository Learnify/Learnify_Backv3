# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!(name: 'Estudiante')
Role.create!(name: 'Profesor')

User.create!(name: 'Juan Camilo' , last_name: 'Rodriguez Puentes' , email: 'jucrodriguezpu@unal.edu.co' , password: '123123123' , password_confirmation: '123123123' , role_id: 1)
Article.create!( title:"Programación con ruby", body:"este es un articulo de programacion ruby", visits_count: 2, user_id: 1)