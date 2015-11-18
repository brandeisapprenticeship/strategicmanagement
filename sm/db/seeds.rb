# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Alan", email: "asun@brandeis.edu", password: '12345678', admin: true)
User.create(name: "Brad", email: "bpayne@brandeis.edu", password: '12345678', admin: true)
User.create(name: "Paul Kang", email: "paul@brandeis.edu", password: '12345678', admin: false)
User.create(name: "Kathy Nguyen", email: "kathy@brandeis.edu", password: '12345678')