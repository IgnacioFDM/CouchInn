# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Esto no funciona porque crea un usuario con datos
# que faltan segun la validación del modelo
#user = CreateAdminService.new.call

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

couch_type = CouchType.find_or_create_by!(name: 'Choza')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Casa')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_post = CouchPost.find_or_create_by(title: 'Casa de playa', description: 'Casa a 2 cuadras de la costa', username: 'Coach Finn', rooms: 1, vacants: 2)
puts 'CREATED COUCH POST: ' << couch_post.title
