# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Administrador', email: 'admin@admin.com', password: 'admin123', admin: true)

Plan.create(description: 'Bronze', price: 100, max_restaurants: 1, max_employees: 2, max_items: 20, periodicity: 'Mensal', discount: 0, renew: false, date_signature: Time.now)
Plan.create(description: 'Prata', price: 150, max_restaurants: 3, max_employees: 4, max_items: 40, periodicity: 'Mensal', discount: 0, renew: false, date_signature: Time.now)
Plan.create(description: 'Ouro', price: 200, max_restaurants: 5, max_employees: 6, max_items: 60, periodicity: 'Mensal', discount: 0, renew: false, date_signature: Time.now)
