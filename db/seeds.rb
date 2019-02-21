# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!(name: 'Profesor')
Role.create!(name: 'Estudiante')

Career.create!(name: "Ingeniería de Sistemas y Computación")
Career.create!(name: "Ingeniería Mecatrónica")
Career.create!(name: "Física")
Career.create!(name: "Arquitectura")
Career.create!(name:"Medicina")
Career.create!(name:"Música")

Subject.create!( name:"Programación Ruby", summary:"Ésta es una materia sobre Ruby")
Subject.create!( name:"Cáncer", summary:"Ésta es una materia sobre el cáncer y sus efectos")
Subject.create!( name:"Urbanística", summary:"Ésta es una materia sobre urbanística")
Subject.create( name:"Lectoescritura musical", summary:"Ésta es una materia que desarrolla capacidad auditiva y formación teórica")
Subject.create( name:"Física cuantica", summary:"Ésta materia nos muestra la naturaleza a escalas espacialmente pequeñas")

User.create!(name: 'Admin' , last_name: 'Master', email: 'admin@example.com.co' , password: '123456789' , password_confirmation: '123456789', role_id: 1, career_id: 1)
User.create!(name: 'Juan Camilo' , last_name: 'Rodríguez Puentes' , email: 'jucrodriguezpu@unal.edu.co' , password: '123123123' , password_confirmation: '123123123' , role_id: 2, career_id: 1)

User.create!(name: 'Brian Julian' , last_name: 'Moreno' , email: 'bjmorenon@unal.edu.co' , password: '123123123' , password_confirmation: '123123123' , role_id: 1, career_id: 1)

Article.create!( title:"Programación con ruby", body:"Éste es un artículo de Programación en Ruby", user_id: 1)