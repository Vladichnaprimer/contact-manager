# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.destroy_all
Contact.destroy_all

groups = []
groups << Group.create(name: "Family").id
groups << Group.create(name: "Friends").id
groups << Group.create(name: "Others").id
contact = []

20.times do |i|
	new_contact = {
		id: i,
		name: Faker::Name.name,
		email: Faker::Internet.email,
		company: Faker::Company.name,
		address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
		phone: Faker::PhoneNumber.cell_phone,
		group_id: groups[Random.rand(0..2)]
	}
	contact.push(new_contact)
end

Contact.create(contact)

p "#{Group.count} groups successfully created"

p "#{Contact.count} contacts successfully created"