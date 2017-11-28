# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Super_User",
             email: "super@user.com",
             password:              "superuser",
             password_confirmation: "superuser",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "CSEGSA",
             email: "csegsa@user.com",
             password:              "superuser",
             password_confirmation: "superuser",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "TAMU_Hack",
             email: "tamuhack@user.com",
             password:              "superuser",
             password_confirmation: "superuser",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Aggie_Coding_Club",
             email: "aggiecodingclub@user.com",
             password:              "superuser",
             password_confirmation: "superuser",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Cyber_Security_Club",
             email: "cybersecurityclub@user.com",
             password:              "superuser",
             password_confirmation: "superuser",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end

# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content, anony: false) }
# end