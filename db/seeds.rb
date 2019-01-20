# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


guest = Guest.create({
	name: "akash sharma",
	email: "sharma.akash1892@gmail.com" })

restaurant = Restaurant.create({
	name: "punjabi rasoi",
	email: "sharma.akash1891@gmail.com",
	phone: "1234567980",
	latitude: 18.6523893,
	longitude: 73.7311266,
	morning_shift_start: "09:00 am",
	morning_shift_end: "01:00 pm",
	night_shift_start: "06:00 pm",
	night_shift_end: "11:00 pm" })

table_1 = Table.create({
	restaurant: restaurant,
	name: "table 1",
	min_guest: 4,
	max_guest: 6,
	booked_at: "10:00 am",
	is_free: false })


table_2 = Table.create({
	restaurant: restaurant,
	name: "table 1",
	min_guest: 4,
	max_guest: 8,
	booked_at: "11:00 am",
	is_free: false })

table_3 = Table.create({
	restaurant: restaurant,
	name: "table 1",
	min_guest: 2,
	max_guest: 4,
	is_free: false })

Reservation.create({
	guest: guest,
	restaurant: restaurant,
	table: table_1,
	reservation_time: "20 jan 2019 10:00 am" })