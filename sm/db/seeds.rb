# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Alan", email: "asun@brandeis.edu", password: '12345678', admin: true)
User.create(name: "Brad", email: "bpayne@brandeis.edu", password: '12345678', admin: true)
User.create(name: "Carole", email: "ccarlson@brandeis.edu", password: '12345678', admin: true)
User.create(name: "Ted Williams", email: "ted@brandeis.edu", password: '12345678')
User.create(name: "Wade Boggs", email: "wade@brandeis.edu", password: '12345678')
User.create(name: "Carlton Fisk", email: "carlton@brandeis.edu", password: '12345678')