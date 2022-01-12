# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('subscriptions')
ActiveRecord::Base.connection.reset_pk_sequence!('customers')
ActiveRecord::Base.connection.reset_pk_sequence!('teas')
Customer.create!(first_name: 'Ida', last_name: 'Olson', email: 'idao@email.com', address: '1108 Ichabod St, North Pole, AK 99705')
Customer.create!(first_name: 'Sarah', last_name: 'Carter', email: 'sarahc@email.com', address: '1300 Becky St, North Pole, AK 99705')
Customer.create!(first_name: 'Doug', last_name: 'Olson', email: 'dougo@email.com', address: '2591 Garnet Dr, North Pole, AK 99705')
Tea.create!(title: 'Masala chai', description: 'The traditional drink of India and defined as a blend of black tea, milk, sugar, and spices.', temperature: '212', brew_time: '5')
Tea.create!(title: 'Oolong', description: 'A traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.', temperature: '205', brew_time: '4')
Tea.create!(title: 'Green tea', description: 'A tea made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', temperature: '185', brew_time: '3')
Tea.create!(title: 'Chamomile tea', description: 'An herbal drink made from dried chamomile flowers steeped in water.', temperature: '208', brew_time: '5')
