# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Nettoyage des données..."
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")
City.delete_all
Dog.delete_all
DogSitter.delete_all
Stroll.delete_all
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='dogs'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='dog_sitters'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='strolls'")

cities=[]
dogsitters=[]
dogs=[]

puts "Ajout des villes..."
10.times do
  cities.push City.create!(
    city_name: Faker::Address.city
  )
end

puts "Ajout des dogsitters..."
5.times do
  dogsitters.push DogSitter.create!(
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name,
  phone_number: Faker::PhoneNumber.phone_number,
  city_id: cities.sample.id
  )
end

puts "Ajout des chiens..."
5.times do
  dogs.push Dog.create!(
    name: Faker::Creature::Dog.name,
    city_id: cities.sample.id
  )
end

puts "Ajout des chiens de chaque sitter..."
dogsitters.each do |dogsitter|
  dogs.sample(rand(1..5)).each do |dog|
    dogsitter.dogs.push dog unless dogsitter.dogs.include?(dog)
  end
end
