user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user1 = User.new
user1.name = "Ramiro"
user1.email = 'ramiro@couchinn.com'
user1.password = 'password'
user1.password_confirmation = 'password'
user1.telephone = '0123456789'
user1.birthdate = Date.new(1970,2,1)
user1.premium_expiration = DateTime.current + 2.months
user1.save!
puts 'CREATED REGULAR USER: ' << user1.name
UserPremium.create(user_id: user1.id, coupon_id: 1, paid: true, paidtime: (DateTime.current - 1.month))
UserPremium.create(user_id: user1.id, coupon_id: 2, paid: true, paidtime: DateTime.current)
UserPremium.create(user_id: user1.id, coupon_id: 3, paid: true, paidtime: DateTime.current)


user2 = User.new
user2.name = "Santiago"
user2.email = 'santiago@couchinn.com'
user2.password = 'password'
user2.password_confirmation = 'password'
user2.telephone = '0123456789'
user2.birthdate = Date.new(1960,2,1)
user2.save!
puts 'CREATED REGULAR USER: ' << user2.name

user3 = User.new
user3.name = "TheDog"
user3.email = 'mynameisthedog@couchinn.com'
user3.password = 'password'
user3.password_confirmation = 'password'
user3.telephone = '101'
user3.birthdate = Date.new(1970,2,1)
user1.premium_expiration = DateTime.current + 1.months - 5.days
user3.save!
puts 'CREATED REGULAR USER: ' << user3.name
UserPremium.create(user_id: user3.id, coupon_id: 4, paid: true, paidtime: (DateTime.current - 5.days))


user4 = User.new
user4.name = "Coach Finn"
user4.email = 'coach_finn@couchinn.com'
user4.password = 'password'
user4.password_confirmation = 'password'
user4.telephone = '0123456789'
user4.birthdate = Date.new(1980,2,1)
user4.save!
puts 'CREATED REGULAR USER: ' << user4.name

user5 = User.new
user5.name = "Ricardo"
user5.email = 'ricardo@couchinn.com'
user5.password = 'password'
user5.password_confirmation = 'password'
user5.telephone = '84574'
user5.birthdate = Date.new(1990,11,5)
user5.save!
puts 'CREATED REGULAR USER: ' << user5.name

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

habitacion = CouchType.find_or_create_by!(name: 'Habitacion', disabled: false)
puts 'CREATED COUCH TYPE: ' << habitacion.name


couch_post = CouchPost.find_or_create_by!(title: 'Casa de playa', description: 'Casa a 2 cuadras de la costa', couch_type_id: casa.id , user_id: user1.id , rooms: 1, vacants: 2, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/beachhouse.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post3 = CouchPost.find_or_create_by!(title: 'Cabaña en el bosque', description: 'Cabaña cómoda, en la semana, barro, bichos, vos y yo, ol de nait', couch_type_id: casa.id, user_id: user1.id, rooms: 1, vacants: 1, zone:'La Plata')
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

couch_post = CouchPost.find_or_create_by!(title: 'Buffet de Informática', description: 'Espacioso, con olor a comida, provisiones hay de sobra.', couch_type_id: monoambiente.id, user_id: user2.id, rooms: 1, vacants: 10, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/infobuffet.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post7 = CouchPost.find_or_create_by!(title: 'Cucha Colonial', description: 'Necesito que alguien se quede en mi morada mientras me voy de viaje. Mi perro es amigable, le gustan las visitas y dormir. Desde que el vecino se mudó no es muy activo.', couch_type_id: casa.id, user_id: user2.id, rooms: 1, vacants: 3, zone:'Campana')
couch_post7.mainpic = File.open("app/assets/images/cucha.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post7.save!
puts 'CREATED COUCH POST: ' << couch_post7.title

couch_post = CouchPost.find_or_create_by!(title: 'Despensa Espaciosa', description: 'Tengo una despensa con lugar para una o dos personas. Requisito excluyente que sepan respetar el orden. Cada mañana reviso todo, si algo cambia de lugar los echo. Están avisados.', couch_type_id: monoambiente.id, user_id: user1.id, rooms: 1, vacants: 3, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/toc.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_postx = CouchPost.find_or_create_by!(title: 'Loft amplio', description: 'Tengo mucho lugar! Espero recibir gente divertida.', couch_type_id: monoambiente.id, user_id: user2.id, rooms: 1, vacants: 10, zone:'La Plata')
couch_postx.mainpic = File.open("app/assets/images/minecraft.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_postx.save!
puts 'CREATED COUCH POST: ' << couch_postx.title

couch_post8 = CouchPost.find_or_create_by!(title: 'El edificio más alto', description: 'Soy el dueño del edificio más alto de Dubai. Puedo verlo todo desde acá arriba, pero me tapan las nubes y me siento solo.', couch_type_id: departamento.id, user_id: user1.id, rooms: 10, vacants: 10, zone:'Dubai')
couch_post8.mainpic = File.open("app/assets/images/uphigh.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post8.save!
puts 'CREATED COUCH POST: ' << couch_post8.title

couch_post9 = CouchPost.find_or_create_by!(title: 'Couch sobre ruedas', description: 'Yo pongo el transporte, vos ponés la buena onda, ambos vamos a recorrer el país! Sumate ya!', couch_type_id: trailer.id, user_id: user2.id, rooms: 1, vacants: 2, zone:'La Pampa')
couch_post9.mainpic = File.open("app/assets/images/coolvan.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post9.save!
puts 'CREATED COUCH POST: ' << couch_post9.title

couch_post = CouchPost.find_or_create_by!(title: 'Casa lejana', description: 'Me mudé acá porque el perro de mi vecino no me dejaba tranquilo ni un minuto. Se respira paz.', couch_type_id: casa.id, user_id: user1.id, rooms: 1, vacants: 2, zone:'San Luis')
couch_post.mainpic = File.open("app/assets/images/middlehouse.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Habitación vacía', description: 'Hay espacio, es luminosa. Un día de viento dejé abierta la ventana y aparecieron esas nubes, no sé como sacarlas pero no molestan.', couch_type_id: habitacion.id, user_id: user2.id, rooms: 1, vacants: 2, zone:'Aconcagua')
couch_post.mainpic = File.open("app/assets/images/cloudroom.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_postt = CouchPost.find_or_create_by!(title: 'Tierra lejana', description: 'Tierra de ensueño, con una fauna asombrosa, dragones sobrevuelan la pradera y todo tipo de animales merodean en los alrededores.', couch_type_id: exterior.id, user_id: user1.id, rooms: 1, vacants: 100, zone:'Skyrim')
couch_postt.mainpic = File.open("app/assets/images/skyrim.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_postt.save!
puts 'CREATED COUCH POST: ' << couch_postt.title

couch_post = CouchPost.find_or_create_by!(title: 'Ruinas antiguas', description: 'Vestigios de tiempos más tranquilos. Se requiere precaución por tratarse de algo con alto valor histórico.', couch_type_id: exterior.id, user_id: user2.id, rooms: 10, vacants: 10, zone:'Zona sin nombre')
couch_post.mainpic = File.open("app/assets/images/quetzalcoatlboard.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Casa en la precordillera andina', description: 'Casa linda, paisaje hermoso. En la foto se ven los colectivos que pasan por la zona.', couch_type_id: casa.id, user_id: user1.id, rooms: 2, vacants: 3, zone:'Salta')
couch_post.mainpic = File.open("app/assets/images/casaprecordillera.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

couch_post = CouchPost.find_or_create_by!(title: 'Oficina de 418', description: 'Ambiente de aprendizaje profesional y amistoso. Unite al equipo!', couch_type_id: choza.id, user_id: user1.id, rooms: 1, vacants: 1, zone:'La Plata')
couch_post.mainpic = File.open("app/assets/images/teacave.jpg") unless ENV["COUCHINN_HEROKU"] == "YES"
couch_post.save!
puts 'CREATED COUCH POST: ' << couch_post.title

reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post7.id
reservation.start_date = Date.today + 80.days
reservation.end_date = Date.today + 90.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post7.id
reservation.start_date = Date.today + 101.days
reservation.end_date = Date.today + 102.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post9.id
reservation.start_date = Date.today + 10.days
reservation.end_date = Date.today + 11.days
reservation.amount = 1
reservation.accepted = true
reservation.responded_at = Date.today + 9.days
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user1.id
reservation.couch_post_id = couch_post9.id
reservation.start_date = Date.today + 31.days
reservation.end_date = Date.today + 32.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user2.id
reservation.couch_post_id = couch_post8.id
reservation.start_date = Date.today + 42.days
reservation.end_date = Date.today + 45.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 


reservation = CouchReservationRequest.new
reservation.user_id = user2.id
reservation.couch_post_id = couch_post2.id
reservation.start_date = Date.today + 11.days
reservation.end_date = Date.today + 15.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 

reservation = CouchReservationRequest.new
reservation.user_id = user2.id
reservation.couch_post_id = couch_post3.id
reservation.start_date = Date.today + 69.days
reservation.end_date = Date.today + 71.days
reservation.amount = 1
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 



reservation = CouchReservationRequest.new
reservation.user_id = user2.id
reservation.couch_post_id = couch_post3.id
reservation.start_date = Date.today + 80.days
reservation.end_date = Date.today + 90.days
reservation.amount = 1
reservation.accepted = true
reservation.responded_at = Date.today + 79.days
reservation.save!
puts 'CREATED REQUEST: ' << reservation.user.name << " => " << reservation.couch_post.title 




couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_post8.id
couchpostfeedback.comment = "Me dio vértigo de solo abrir la ventana. 10/10 iría de nuevo."
couchpostfeedback.score = 5
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_post2.id
couchpostfeedback.comment = "Me quedé encerrado porque se trabó la puerta y no supe qué hacer."
couchpostfeedback.score = 2
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user1.id
couchpostfeedback.couch_post_id = couch_post2.id
couchpostfeedback.comment = "No había WiFi."
couchpostfeedback.score = 1
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user3.id
couchpostfeedback.couch_post_id = couch_post5.id
couchpostfeedback.comment = "No estoy seguro de si volví al mismo universo del cuál vengo."
couchpostfeedback.score = 5
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user3.id
couchpostfeedback.couch_post_id = couch_post7.id
couchpostfeedback.comment = "Nos re divertimos!"
couchpostfeedback.score = 5
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_post3.id
couchpostfeedback.comment = "El bosque mas o menos zafaba pero bastante comuncito todo, un re viaje al p- en vano."
couchpostfeedback.score = 1
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user5.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Me gustó pero prefiero manejar mi Rolls Royce."
couchpostfeedback.score = 2
couchpostfeedback.created_at = DateTime.new(2015,12,1,17)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Bueno, la próxima traelo y organizamos una caravana."
couchpostfeedback.created_at = DateTime.new(2015,12,1,18)
couchpostfeedback.score = nil
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user5.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Ok pero solo si vamos a Miami."
couchpostfeedback.score = nil
couchpostfeedback.created_at =DateTime.new(2015,12,2,19)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 


couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user4.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Puedo ir cuando vaya Ricardo?"
couchpostfeedback.score = nil
couchpostfeedback.created_at =DateTime.new(2015,12,3,20)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user5.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Basta chicos."
couchpostfeedback.score = nil
couchpostfeedback.created_at = DateTime.new(2015,12,3,20)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user5.id
couchpostfeedback.couch_post_id = couch_post4.id
couchpostfeedback.comment = "Por este Couch llegué tarde a mi mansión. Basta chicos."
couchpostfeedback.score = 1
couchpostfeedback.created_at = DateTime.new(2015,12,4,20)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_post4.id
couchpostfeedback.comment = "Inaguantable, los bocinazos no dejan dormir."
couchpostfeedback.score = 1
couchpostfeedback.created_at = DateTime.new(2015,12,4,20)
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user1.id
couchpostfeedback.couch_post_id = couch_post9.id
couchpostfeedback.comment = "Estuvo re bueno, aprovechen y vivan la experiencia!"
couchpostfeedback.score = 4
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user1.id
couchpostfeedback.couch_post_id = couch_postx.id
couchpostfeedback.comment = "Lindo lugar pero muy cuadrado, la cama medio incómoda."
couchpostfeedback.score = 4
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user2.id
couchpostfeedback.couch_post_id = couch_postt.id
couchpostfeedback.comment = "Wow, era verdad lo de los dragones.."
couchpostfeedback.created_at = DateTime.new(2015,6,1,18)
couchpostfeedback.score = 5
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

couchpostfeedback = CouchPostFeedback.new
couchpostfeedback.user_id = user5.id
couchpostfeedback.couch_post_id = couch_postt.id
couchpostfeedback.comment = "Me hice un abrigo de piel con las criaturas que pudimos cazar."
couchpostfeedback.created_at = DateTime.new(2015,9,1,18)
couchpostfeedback.score = 5
couchpostfeedback.save!
puts 'CREATED COUCH POST FEEDBACK: ' << couchpostfeedback.user.name << " => " << couchpostfeedback.couch_post.title 

user_feedback = UserFeedback.new do |f|
  f.author = user
  f.user = user1
  f.comment = "Al cabo que ni quería dormir."
  f.rating = "1"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user2
  f.user = user
  f.comment = "Irrespetuoso total. Me tocó la jalea."
  f.rating = "1"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user2
  f.user = user1
  f.comment = "Agradable, voy a ir a futuros Couches con él."
  f.rating = "5"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user5
  f.user = user1
  f.comment = "Su nombre se parece al mío, me reí mucho con eso."
  f.rating = "5"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user
  f.user = user2
  f.comment = "Me gustó bastennete la atención."
  f.rating = "2"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user3
  f.user = user4
  f.comment = "Quiero dar las gracias."
  f.rating = "4"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user
  f.user = user3
  f.comment = "todo ok"
  f.rating = "3"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user
  f.user = user4
  f.comment = "Muy mal usuario. Lo voy a eliminar."
  f.rating = "4"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user
  f.user = user5
  f.comment = "Hm."
  f.rating = "5"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end

user_feedback = UserFeedback.new do |f|
  f.author = user5
  f.user = user2
  f.comment = "Te quedaste con mi cutu-cuchillo. La próxima salida me lo devolvés."
  f.rating = "5"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end


user_feedback = UserFeedback.new do |f|
  f.author = user3
  f.user = user2
  f.comment = "He came up over the horizon in my sky, unacceptable."
  f.rating = "1"
  f.save!
  puts 'CREATED USER FEEDBACK ' << "WRITTEN BY " << f.author.name << " TO " << f.user.name 
end


