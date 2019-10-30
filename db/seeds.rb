# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  roles = %w[manager, user]
  roles.each { |role| Role.create(name: role) }

  manager = User.create(email: "manager@email.com")
  manager.role = Role.find_by_name("manager")
