require "json"
require "rest-client"

api = RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json'

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
10.times do
  post_parse = JSON.parse(api).sample
  post = RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{post_parse}.json")
  post_json = JSON.parse(post)
  Post.create(title: post_json["title"], url: post_json["url"], votes: post_json["score"])
end
