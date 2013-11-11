# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gryffindor = House.create({:name => "Gryffindor"})
hufflepuff = House.create({:name => "Hufflepuff"})
ravenclaw	 = House.create({:name => "Ravenclaw"})
slytherin	 = House.create({:name => "Slytherin"})

[
	{ :name => "Harry Potter",     :house => gryffindor },
	{ :name => "Helga Hufflepuff", :house => hufflepuff },
	{ :name => "Cho Chang",        :house => ravenclaw  },
	{ :name => "Draco Malfoy",     :house => slytherin  }
].each { |student| Student.create(student) }