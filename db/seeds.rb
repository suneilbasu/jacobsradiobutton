# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email: 'jo@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Jo',
  last_name: 'Butler',
  office_location: 'Bristol',
  role: 1

) unless User.where(email: 'jo@mail.com').exists?

User.create!(
  email: 'bob@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Bob',
  last_name: 'Backwards',
  office_location: 'Bristol',
  role: 0

) unless User.where(email: 'bob@mail.com').exists?
