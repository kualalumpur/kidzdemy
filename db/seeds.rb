# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.find_or_create_by(name: 'Robotics', description: 'Robotics is the branch of mechanical engineering, electrical engineering and computer science that deals with the design, construction, operation, and application of robots, as well as computer systems for their control, sensory feedback, and information processing.')
Category.find_or_create_by(name: 'Programming', description: 'Computer programming (often shortened to programming) is a process that leads from an original formulation of a computing problem to executable computer programs.')
Category.find_or_create_by(name: 'App Development', description: 'Mobile application development is a term used to denote the act or process by which application software is developed for mobile devices, such as personal digital assistants, enterprise digital assistants or mobile phones.')

5.times do |i|
  User.create(email: "user#{i+1}@email.com", password: "password")
end

3.times do |i|
  8.times do |j|
  Event.create(title: "Event ##{j+1} Catchy Title", description: "This is an <strong>event description</strong>. We are trying to accommodate super long description, will have to check later <br /><br />if it supports HTML or just plain text", start: Time.new(2016,11,22, 12, 00), end: Time.new(2016,11,22, 18, 00), venue: "MaGIC Cyberjaya", organizer_name: "Petrosains Malaysia Super Inc", organizer_description: "This is <strong>organizer description</strong> with HTML <br /><br /> hahaha come visit us in KLCC", category_id: i+1, user_id: i+1)
  end
end
