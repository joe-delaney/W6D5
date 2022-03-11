# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

c1 = Cat.create!(name: 'jerry', color: 'grey', sex: 'M', birth_date: '2000/08/27', description: 'I am a mouse')
c2 = Cat.create!(name: 'gargfield', color: 'orange', sex: 'M', birth_date: '2009/08/27', description: 'Eating lasagna')
c3 = Cat.create!(name: 'bro', color: 'black', sex: 'F', birth_date: '1999/08/27', description: 'I am a bro')
c4 = Cat.create!(name: 'mom', color: 'grey', sex: 'F', birth_date: '1900/06/27', description: 'I am a mom')