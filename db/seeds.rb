# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DisplayType.create(name: "RLD", rows: 5, columns: 26)
DisplayType.create(name: "FLD (top)", rows: 5, columns: 8)
DisplayType.create(name: "FLD (bottom)", rows: 5, columns: 8)