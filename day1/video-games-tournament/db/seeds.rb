# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = Player.create([
	{name: "Manolete"},
	{name: "Joselillo"},
	{name: "Juan Pablito"},
	{name: "Pepe"}])

tournaments = Tournament.create([
	{name: "Bailes de salón"},
	{name: "Tiro con arco"}])


10.times do
	Registration.create(player_id: rand(Player.count), tournament_id: rand(Tournament.count))	
end