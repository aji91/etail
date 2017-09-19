# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['Admin', 'Client', 'Employee'].each do |role|
	Role.find_or_create_by(name: role)	
end

User.create(
	user_name: 'Ajith kumar',
	company_name: 'Test company',
	designation: 'Admin',
	role_id: 1,
	phone: '1234567890',
	email: 'admin@example.com',
	password: 'password',
	password_confirmation: 'password'
)
