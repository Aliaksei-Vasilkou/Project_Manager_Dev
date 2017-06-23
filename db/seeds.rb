%w[admin user].each do |role|
  Role.find_or_create_by({name: role})
end

# ['New', 'In progress', 'Done'].each do |status|
#   Status.find_or_create_by({name: status})
# end

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