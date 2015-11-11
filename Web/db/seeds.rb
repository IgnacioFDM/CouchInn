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

user = User.new
user.name = "Ramiro"
user.email = 'ramiro@couchinn.com'
user.password = 'password'
user.password_confirmation = 'password'
user.telephone = '0123456789'
user.birthdate = Date.new(1970,2,1)
user.save!
puts 'CREATED REGULAR USER: ' << user.name

user = User.new
user.name = "Santiago"
user.email = 'santiago@couchinn.com'
user.password = 'password'
user.password_confirmation = 'password'
user.telephone = '0123456789'
user.birthdate = Date.new(1970,2,1)
user.save!
puts 'CREATED REGULAR USER: ' << user.name

user = User.new
user.name = "Doggo"
user.email = 'altoke_perro@dogchow.com'
user.password = 'passwoof'
user.password_confirmation = 'passwoof'
user.telephone = '101'
user.birthdate = Date.new(1970,2,1)
user.save!
puts 'CREATED REGULAR USER -kind of-: ' << user.name

user = User.new
user.name = "Coach Finn"
user.email = 'Coach_Finn@couchinn.com'
user.password = 'password'
user.password_confirmation = 'password'
user.telephone = '0123456789'
user.birthdate = Date.new(1980,2,1)
user.save!
puts 'CREATED REGULAR USER: ' << user.name

couch_type = CouchType.find_or_create_by!(name: 'Choza')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Casa')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Carpa')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Monoambiente')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Departamento')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Trailer')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_type = CouchType.find_or_create_by!(name: 'Exterior')
puts 'CREATED COUCH TYPE: ' << couch_type.name

couch_post = CouchPost.find_or_create_by!(title: 'Casa de playa', description: 'Casa a 2 cuadras de la costa', couch_type_id: 2, username: 'Coach Finn', rooms: 1, vacants: 2, zone:'La Plata')

couch_post.mainpic = File.open("app/assets/images/Monoambiente.jpg")
couch_post.save!

puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Cabaña en el bosque', description: 'Cabaña cómoda, en la semana, barro, bichos, vos y yo, ol de nait', couch_type_id: 1, username: 'Sátiro', rooms: 1, vacants: 1, zone:'La Plata')

couch_post.mainpic = File.open("app/assets/images/Choza.jpg")
couch_post.save!

puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Carpa en Microcentro', description: 'Best option for humble tourists, make your reservations now!', couch_type_id: 3, username: 'Lionel Hutz', rooms: 1, vacants: 4, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/Cabana.jpg")
couch_post.save!


couch_post = CouchPost.find_or_create_by!(title: 'Aula de Informática', description: 'No cierra la puerta así que duermo ahí por las noches, están todos invitados.', couch_type_id: 4, username: 'Bubi el perro', rooms: 1, vacants: 10, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/Monoambiente.jpg")
couch_post.save!


couch_post = CouchPost.find_or_create_by!(title: 'Distorsión Espacio-Tiempo', description: 'Singularidad infinitamente amplia -literalmente-. Se está un poco apretado pero siempre hay lugar para uno más.', couch_type_id: 9, username: 'Gravitón', rooms: 1, vacants: 99, zone:'Sagittariius A*')
couch_post.mainpic = File.open("app/assets/images/Cabana.jpg")
couch_post.save!

puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Garage vacío', description: 'Tuve que vender el auto así que cuento con lugar extra para los que busquen un lugar donde quedarse un tiempo. Eso sí, ojo con las manchas de aceite.', couch_type_id: 4, username: 'Cacho', rooms: 1, vacants: 4, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/Cabana.jpg")
couch_post.save!

puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Casa rodante equipada', description: 'Ofrezco alojamiento y pago a cambio de colaboración con proyecto personal de Química. Cuantas menos cosas preguntes, mejor nos vamos a llevar.', couch_type_id: 6, username: 'Heisenberg', rooms: 1, vacants: 1, zone:'Los Hornos')
puts 'CREATED COUCH POST: ' << couch_post.title
couch_post.mainpic = File.open("app/assets/images/Monoambiente.jpg")
couch_post.save!


couch_post = CouchPost.find_or_create_by!(title: 'Depósito del súpel', description: 'Chino tenel lugal. Lugal pala pelsona. No chico, glande, cole aile flesco.', couch_type_id: 2, username: 'Xin Xu Lin', rooms: 1, vacants: 2, zone:'La Plata')
puts 'CREATED COUCH POST: ' << couch_post.title
couch_post.mainpic = File.open("app/assets/images/Monoambiente.jpg")
couch_post.save!


couch_post = CouchPost.find_or_create_by!(title: 'Buffet de Informática', description: 'No cierra la puerta así que duermo ahí por las noches, están todos invitados.', couch_type_id: 4, username: 'Bubi el perro', rooms: 1, vacants: 10, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/Choza.jpg")
couch_post.save!
