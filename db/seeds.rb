# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teachers = User.create! [
            { email: 'nuriel98@gmail.com', name: 'nuriel zuaretz', password: '123456', password_confirmation: '123456',  },
            { email: 'dannyca@openu.ac.il', name: 'Danny Calfon', password: '123456', password_confirmation: '123456', }]
teachers.each { |t| t.is_teacher = true; t.save! }

teachers[0].classrooms.create!(name: 'Ruby Beginners classroom', video_url: 'https://www.youtube.com/watch?v=sCgwFg6ti0c')
teachers[1].classrooms.create!(name: 'Computer Networks workshop', video_url: 'https://www.youtube.com/watch?v=sCgwFg6ti0c')


