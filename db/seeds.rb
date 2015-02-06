# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.where(name: 'PM1').first_or_create
Tag.where(name: 'PM2').first_or_create
Tag.where(name: 'PM3').first_or_create
Tag.where(name: 'QCloud').first_or_create
