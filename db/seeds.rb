# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
p 'creating user'

u1=User.create!(
  name: "Admin",
  email: 'admin@email.com',
  admin: 1,
  password: 'chicken'
)

u2=User.create!(
  name: "Guest",
  email: 'guest@email.com',
  admin: 0,
  password: 'chicken'
)

puts "Created #{User.count} users"
puts User.pluck(:name).join(',')

# Airplane.destroy_all

p 'creating airplanes'

a1=Airplane.create!(
  name: "Bi-plane",
  rows: 10,
  cols: 6
)

a2=Airplane.create!(
  name: "747",
  rows: 20,
  cols: 9
)

puts "Created #{Airplane.count} aeroplanes"
puts Airplane.pluck(:name).join(',')

# Flight.destroy_all

p 'creating flights'

f1=Flight.create!(
  flight_number: '23',
  scheduled: "01/01/2021",
  to: "Sydney",
  from: "Perth",
  airplane_id: a1.id
)

f2=Flight.create!(
  flight_number: '87',
  scheduled: "02/02/2021",
  to: "Melbourne",
  from: "Perth",
  airplane_id: a2.id
)

puts "Created #{Flight.count} flights"
puts Flight.pluck(:to).join(',')
