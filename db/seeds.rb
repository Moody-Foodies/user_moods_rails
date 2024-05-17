# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Mood.destroy_all

Mood.create!(user_id: 1, mood: 3, date: "2024-05-01")
Mood.create!(user_id: 1, mood: 4, date: "2024-05-02")
Mood.create!(user_id: 1, mood: 1, date: "2024-05-03")
Mood.create!(user_id: 1, mood: 2, date: "2024-05-04")
Mood.create!(user_id: 1, mood: 5, date: "2024-05-05")
Mood.create!(user_id: 1, mood: 2, date: "2024-05-06")
Mood.create!(user_id: 1, mood: 3, date: "2024-05-07")
Mood.create!(user_id: 1, mood: 4, date: "2024-05-08")