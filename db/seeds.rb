# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# 4.times do
#     publication = Publication.create!(
#       title: Faker::Book.title,
#       content: Faker::Lorem.paragraph
#     )
  
#     # Crear comentarios ficticios para cada publicación
# 5.times do
#       publication.comments.create!(
#         author: Faker::Name.name,
#         body: Faker::Lorem.sentence
#       )
#     end
#   end
  
