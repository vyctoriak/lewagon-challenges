require "faker"
# TODO: Write a seed to insert 100 posts in the database
100.times do
  Post.create(title: Faker::Lorem.sentence(word_count: 3), url: Faker::Internet.url, votes: rand(1..100),
              created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
              updated_at: Faker::Date.between(from: 2.days.ago, to: Date.today))
end
