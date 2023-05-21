# Seed file to create sample users

# Create 10 users
10.times do |n|
    user = User.create!(
      email: Faker::Internet.unique.email,
      password: 'password',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.sentence(word_count: 10),
      admin: false
    )
  
    puts "Created user #{n + 1}: #{user.email}"
  end
  
  # Create 20 events
  20.times do |n|
    user = User.offset(rand(User.count)).first
    event = Event.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      start_datetime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
      duration: Faker::Number.between(from: 1, to: 5),
      location: Faker::Address.city,
      description: Faker::Lorem.sentence(word_count: 10),
      price: Faker::Number.between(from: 0, to: 100),
      admin: user
    )
  
    puts "Created event #{n + 1}: #{event.title} (by #{user.email})"
  end
  