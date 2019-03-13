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

User.create!(name: 'Admin' , last_name: 'Master', email: 'admin@example.com.co' , password: '123456789' , password_confirmation: '123456789', role_id: 1, career_id: 2)
User.create!(name: 'Iván Yesid', last_name: 'Castellanos Martínez', email: 'iycastellanosm@unal.edu.co', password: '123456789', password_confirmation: '123456789', role_id: 1, career_id: 1)
User.create!(name: 'Brian Julian' , last_name: 'Moreno' , email: 'bjmorenon@unal.edu.co' , password: '123123123' , password_confirmation: '123123123' , role_id: 1, career_id: 1)
User.create!(name: 'Juan Camilo' , last_name: 'Rodríguez Puentes' , email: 'jucrodriguezpu@unal.edu.co' , password: '123123123' , password_confirmation: '123123123' , role_id: 2, career_id: 1)

Subject.create!( name:"Programación Ruby", summary:"Ésta es una materia sobre Ruby", user_id: 2, users: User.where(id: 2))
Subject.create!( name:"Cáncer", summary:"Ésta es una materia sobre el cáncer y sus efectos", user_id: 3, users: User.where(id: 3))
Subject.create!( name:"Urbanística", summary:"Ésta es una materia sobre urbanística", user_id: 2, users: User.where(id: 2))
Subject.create( name:"Lectoescritura musical", summary:"Ésta es una materia que desarrolla capacidad auditiva y formación teórica", user_id: 3, users: User.where(id: 3))
Subject.create( name:"Física cuantica", summary:"Ésta materia nos muestra la naturaleza a escalas espacialmente pequeñas", user_id: 2, users: User.where(id: 3))

# s = Subject.find_by(name: "Programación Ruby")
# s.users << User.find_by(id: 2)
# d = Subject.find_by(name: "Cáncer")
# d.users << User.find_by(id: 3)
# e = Subject.find_by(name: "Urbanística")
# e.users << User.find_by(id: 2)
# s = Subject.find_by(name: "Lectoescritura musical")
# s.users << User.find_by(id: 3)
# f = Subject.find_by(name: "Física cuántica")
# f.users << User.find_by(id: 2)

Article.create!( title:"Programación con ruby", body:"Éste es un artículo de Programación en Ruby", visits_count: 0, url: "https://github.com/Juankmilo97/DeviseGemTutorial", user_id: 2)
Article.create!( title:"Cura del cáncer", body:"Artículo sobre los estudios sobre la cura del cáncer", visits_count: 0, url: "https://github.com/Juankmilo97/DeviseGemTutorial", user_id: 3)
Article.create!( title:"Modelado de interiores", body:"Artículo de como modelar interiores", visits_count: 0, url: "https://github.com/Juankmilo97/DeviseGemTutorial", user_id: 2)
Article.create!( title:"La música es el espejo de la mente", body:"Éste artículo nos habla de la relación entre el cerebro y la música", visits_count: 0, url: "https://github.com/Juankmilo97/DeviseGemTutorial", user_id: 3)
Article.create!( title:"Partículas subatómicas", body:"Éste articulo nos habla de partículas subatómicas (bariones)", visits_count: 0, url: "https://github.com/Juankmilo97/DeviseGemTutorial", user_id: 2)