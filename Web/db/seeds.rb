user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user1 = User.new
user1.name = "Ramiro"
user1.email = 'ramiro@couchinn.com'
user1.password = 'password'
user1.password_confirmation = 'password'
user1.telephone = '0123456789'
user1.birthdate = Date.new(1970,2,1)
user1.save!
puts 'CREATED REGULAR USER: ' << user1.name

user2 = User.new
user2.name = "Santiago"
user2.email = 'santiago@couchinn.com'
user2.password = 'password'
user2.password_confirmation = 'password'
user2.telephone = '0123456789'
user2.birthdate = Date.new(1970,2,1)
user2.save!
puts 'CREATED REGULAR USER: ' << user2.name

user3 = User.new
user3.name = "Doggo"
user3.email = 'altoke_perro@dogchow.com'
user3.password = 'passwoof'
user3.password_confirmation = 'passwoof'
user3.telephone = '101'
user3.birthdate = Date.new(1970,2,1)
user3.save!
puts 'CREATED REGULAR USER: ' << user3.name

user4 = User.new
user4.name = "Coach Finn"
user4.email = 'coach_finn@couchinn.com'
user4.password = 'password'
user4.password_confirmation = 'password'
user4.telephone = '0123456789'
user4.birthdate = Date.new(1980,2,1)
user4.save!
puts 'CREATED REGULAR USER: ' << user4.name

choza = CouchType.find_or_create_by!(name: 'Choza', disabled: false)
puts 'CREATED COUCH TYPE: ' << choza.name

casa = CouchType.find_or_create_by!(name: 'Casa', disabled: false)
puts 'CREATED COUCH TYPE: ' << casa.name

carpa = CouchType.find_or_create_by!(name: 'Carpa', disabled: false)
puts 'CREATED COUCH TYPE: ' << carpa.name

monoambiente = CouchType.find_or_create_by!(name: 'Monoambiente', disabled: false)
puts 'CREATED COUCH TYPE: ' << monoambiente.name

departamento = CouchType.find_or_create_by!(name: 'Departamento', disabled: false)
puts 'CREATED COUCH TYPE: ' << departamento.name

trailer = CouchType.find_or_create_by!(name: 'Trailer', disabled: false)
puts 'CREATED COUCH TYPE: ' << trailer.name

exterior = CouchType.find_or_create_by!(name: 'Exterior', disabled: false)
puts 'CREATED COUCH TYPE: ' << exterior.name


couch_post = CouchPost.find_or_create_by!(title: 'Casa de playa', description: 'Casa a 2 cuadras de la costa', couch_type_id: casa.id , user_id: user1.id , rooms: 1, vacants: 2, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/beachhouse.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post3 = CouchPost.find_or_create_by!(title: 'Cabaña en el bosque', description: 'Cabaña cómoda, en la semana, barro, bichos, vos y yo, ol de nait', couch_type_id: casa.id, user_id: user2.id, rooms: 1, vacants: 1, zone:'La Plata')
couch_post3.mainpic = File.open("app/assets/images/forestcabin.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post3.save!
puts 'CREATED COUCH POST: ' << couch_post3.title

couch_post4 = CouchPost.find_or_create_by!(title: 'Carpa en Microcentro', description: 'Best option for humble tourists, make your reservations now!', couch_type_id: carpa.id, user_id: user3.id, rooms: 1, vacants: 4, zone:'La Plata')
couch_post4.mainpic = File.open("app/assets/images/citytent.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post4.save!
puts 'CREATED COUCH POST: ' << couch_post4.title

couch_post2 = CouchPost.find_or_create_by!(title: 'Aula de Informática', description: 'No cierra la puerta así que duermo ahí por las noches, están todos invitados.', couch_type_id: monoambiente.id, user_id: user1.id, rooms: 1, vacants: 10, zone:'La Plata')
couch_post2.mainpic = File.open("app/assets/images/uniroom.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post2.save!
puts 'CREATED COUCH POST: ' << couch_post2.title

couch_post5 = CouchPost.find_or_create_by!(title: 'Distorsión Espacio-Tiempo', description: 'Singularidad infinitamente amplia -literalmente-. Se está un poco apretado pero siempre hay lugar para uno más.', couch_type_id: exterior.id , user_id: user1.id, rooms: 1, vacants: 99, zone:'Sagittariius A*')
couch_post5.mainpic = File.open("app/assets/images/singo.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post5.save!
puts 'CREATED COUCH POST: ' << couch_post5.title

couch_post = CouchPost.find_or_create_by!(title: 'Garage vacío', description: 'Tuve que vender el auto así que cuento con lugar extra para los que busquen un lugar donde quedarse un tiempo. Eso sí, ojo con las manchas de aceite.', couch_type_id: monoambiente.id, user_id: user2.id, rooms: 1, vacants: 4, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/emptygarage.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Casa rodante equipada', description: 'Ofrezco alojamiento y pago a cambio de colaboración con proyecto personal de Química. Cuantas menos cosas preguntes, mejor nos vamos a llevar.', couch_type_id: trailer.id, user_id: user3.id, rooms: 1, vacants: 1, zone:'Los Hornos')
couch_post.mainpic = File.open("app/assets/images/trailer.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Depósito del súpel', description: 'Chino tenel lugal. Lugal pala pelsona. No chico, glande, cole aile flesco.', couch_type_id: casa.id, user_id: user4.id, rooms: 1, vacants: 2, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/almacen1.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Buffet de Informática', description: 'No cierra la puerta así que duermo ahí por las noches, están todos invitados.', couch_type_id: monoambiente.id, user_id: user2.id, rooms: 1, vacants: 10, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/infobuffet.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post.id
reservation.start_date = Date.new(2017,8,15)
reservation.end_date = Date.new(2017,9,19)
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post.id
reservation.start_date = Date.new(2017,3,7)
reservation.end_date = Date.new(2017,3,8)
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post.id
reservation.start_date = Date.new(2016,2,2)
reservation.end_date = Date.new(2016,2,5)
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 

reservation = CouchReservationRequest.new
reservation.user_id = user2.id
reservation.couch_post_id = couch_post2.id
reservation.start_date = Date.new(2016,2,2)
reservation.end_date = Date.new(2016,2,5)
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 