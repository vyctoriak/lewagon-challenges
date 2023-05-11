class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display_posts(posts)
    posts.each do |post|
      puts "#{post.id} - #{post.title} - #{post.url} - #{post.votes}"
    end
  end

  def ask_for_title
    puts "Enter a title:"
    gets.chomp
  end

  def ask_for_url
    puts "Enter a url:"
    gets.chomp
  end

  def ask_for_id
    puts "Enter an id:"
    gets.chomp.to_i
  end
end
