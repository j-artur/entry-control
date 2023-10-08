# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a main unit
unit = Unit.create(name: "Principal")

# Create a main sector
sector = Sector.create(name: "Administração", unit_id: unit.id)

# Create a main admin user
user = User.create(
  name: "Admin",
  email: "admin@admin.com",
  password: "admin123",
  password_confirmation: "admin123",
  role: "admin",
  sector_id: sector.id,
)
