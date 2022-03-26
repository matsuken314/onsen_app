# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: ENV["EMAIL"], password: ENV["ADMIN_KEY"], password_confirmation: ENV["ADMIN_KEY"]) if Rails.env.development?

user = AdminUser.new(email: ENV["PRODUCTION_EMAIL"], password: ENV["PRODUCTION_ADMIN_KEY"], password_confirmation: ENV["PRODUCTION_ADMIN_KEY"],confirmed_at: Time.now) if Rails.env.production?
user.skip_confirmation!
user.save!