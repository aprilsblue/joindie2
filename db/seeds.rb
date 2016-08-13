# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genre_preset = ["락", "발라드", "슈게이징", "일렉트로닉", "메탈", "헤비메탈", "어쿠스틱"]
teams = (1..20)
teams_a = teams.to_a
events = (1..100)
events_a = events.to_a
joins = (1..200)

# 20 Random Team
teams.each do |i|
  team = Team.new
  team.email = Faker::Internet.email
  team.encrypted_password = Faker::Internet.password(8)
  team.name = Faker::Name.name
  team.genre = genre_preset.sample
  team.mobile = Faker::PhoneNumber.cell_phone
  team.homepage_url = Faker::Internet.url
  team.description = Faker::Lorem.paragraph
  team.num_of_member = Faker::Number.between(1, 6)
  team.save!(validate: false)
end

# 100 Random Event
events.each do |i|
  event = Event.new
  event.team_id = teams_a.sample
  event.place = Faker::Pokemon.location
  event.showtime = Faker::Time.between(DateTime.now - 1, DateTime.now + 20.days) #=> "2014-09-18 12:30:59 -0700"
  event.rental_fee = Faker::Number.between(10, 60)

  file = Tempfile.new(['temp', '.png'])
  stringio = open(Faker::Placeholdit.image('200x283', 'png', Faker::Color.hex_color[1..6], Faker::Color.hex_color[1..6], Faker::Lorem.word))
  file.binmode
  file.write stringio.read
  event.poster = file
  event.save!
end

# 200 Random Join
joins.each do |i|
  join = Join.new
  join.team_id = teams_a.sample
  join.event_id = events_a.sample
  join.description = Faker::Lorem.paragraph
  join.approved = Faker::Boolean.boolean(0.5)
  join.save!
end
