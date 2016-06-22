# create 5 users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'helloworld'
    )
end

25.times do
  RegisteredApplication.create!(
    user_id: 1 + rand(User.count),
    name: Faker::Name.name,
    url: Faker::Internet.url
    )
end

50.times do
  ra_id = RegisteredApplication.all.sample.id
  Event.create!(
    registered_application_id: ra_id,
    event_name: RegisteredApplication.find(ra_id).name
    )
end

puts 'Seeds finished'
puts "#{User.count} Users created"
puts "#{RegisteredApplication.count} RegisteredEvents created"
puts "#{Event.count} Events created"