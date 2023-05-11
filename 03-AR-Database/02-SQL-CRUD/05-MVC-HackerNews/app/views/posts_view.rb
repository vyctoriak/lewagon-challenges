class PostsView
  # TODO: implement methods called by the PostsController
  def display_posts(posts)
    posts.each do |post|
      puts "#{post.id} - #{post.title} - #{post.url} - #{post.votes}"
    end
  end

  def display_error(message)
    puts message
  end

  def ask_informations_for_new_post
    title = ask_for_title
    url = ask_for_url
    { title: title, url: url }
  end

  def ask_informations_to_update_post
    title = ask_for_new_title
    url = ask_for_new_url
    { title: title, url: url, votes: vote }
  end

  def ask_the_vote
    puts 'What is the vote of your post?'
    gets.chomp.to_i
  end

  def ask_for_id_to_destroy
    puts 'What is the id of the post you want to destroy?'
    gets.chomp
  end

  def ask_for_id_to_upvote
    puts 'What is the id of the post you want to upvote?'
    gets.chomp
  end

  def ask_for_id_to_update
    puts 'What is the id of the post you want to update?'
    gets.chomp
  end

  private

  def ask_for_new_title
    puts 'What is the new title of your post?'
    gets.chomp
  end

  def ask_for_new_vote
    puts 'What is the new vote of your post?'
    gets.chomp
  end

  def ask_for_new_url
    puts 'What is the new url of your post?'
    gets.chomp
  end

  def ask_for_title
    puts 'What is the title of your post?'
    gets.chomp
  end

  def ask_for_url
    puts 'What is the url of your post?'
    gets.chomp
  end
end
