# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(email: 'user@example.com', nickname: 'chayon', name: 'Rifatul Islam Chayon', password: "12345678")
10.times do |i|
  Movie.create(title: "Demon Movie #{i+1}", description: "Demo description #{i+1}, Demo description #{i+1}, Demo description #{i+1}, Demo description #{i+1}", release_date: Date.today + (1*7).days)
end