%w[admin user].each do |role|
  Role.find_or_create_by({name: role})
end

['New', 'In progress', 'Done'].each do |status|
  Status.find_or_create_by({name: status})
end