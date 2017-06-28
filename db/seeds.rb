%w[admin user].each do |role|
  Role.find_or_create_by({name: role})
end

['New', 'In progress', 'Done'].each do |status|
  Status.find_or_create_by({name: status})
end

# Role.create(name: 'admin')
# Role.create(name: 'user')
#
# Status.create(name: 'New')
# Status.create(name: 'In progress')
# Status.create(name: 'Done')

User.create!( first_name:  'Alexey',
              last_name:   'Vasilkov',
              email:       'coyc@inbox.ru',
              password:    '123456',
              password_confirmation: '123456',
              admin: false )

User.create!( first_name:  'Admin',
              last_name:   'Adminovich',
              email:       'admin@example.ru',
              password:    '123456',
              password_confirmation: '123456',
              admin: true )

# #Count variables
# # @total_users = 50
# # @total_projects = 10

50.times do
  User.create( first_name: Faker::Name.first_name,
               last_name:  Faker::Name.last_name,
               email:      Faker::Internet.email('example'),
               password:   '123456',
               password_confirmation: '123456',
               admin: false )
end

10.times do
  Project.create( name:       Faker::Lorem.word,
                  summary:    Faker::Lorem.sentence,
                  start_date: Faker::Date.between(5.days.ago, Date.today),
                  end_date:   Faker::Date.forward(30),
                  user_id:    Random.rand(1..50) )
end

50.times do
  Task. create(   title:      Faker::Lorem.word,
                  description:Faker::Lorem.sentence(4),
                  project_id: Random.rand(1..10),
                  status_id:  Random.rand(1..2),
                  user_id:    Random.rand(1..50),
                  owner:      Random.rand(1..50) )
end
