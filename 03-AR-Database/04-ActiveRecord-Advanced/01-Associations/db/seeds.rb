# TODO: Write a seed

require 'faker'

5.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email
  )
end

User.all.each do |user|
  rand(5..10).times do
    user.posts.create(
      title: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      votes: rand(0..100)
    )
  end
end
