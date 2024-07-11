# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# === NOTE: FROM JECODE93 ===

# If you like using fixtures for your tests, you may know that instead of running
# bin/rails db:seed you can run bin/rails db:fixtures:load to create
# development data from your fixtures files. Let's tell Rails that the two
#  commands are equivalent in the db/seeds.rb file:

puts "\n== Seeding the database with fixtures =="
system('bin/rails db:fixtures:load')
