# # Write a method that returns the acronym of a sentence.


# # def acronymize(sentence)
# #   sentence = sentence.split(" ")
# #   acronym = ""
# #   sentence.each do |word|
# #     acronym += word[0].upcase
# #   end
# #   return acronym
# # end

# # p acronymize("Hello World")

def acronym(sentence)
  # if sentence.include?('and')
    # remove_and = sentence.gsub('and', '')
    setence.split.map { |word| word[0].upcase }.join
  # else
  #   sentence.split.map { |word| word[0].upcase }.join
  # ends
end

# def acronym2(sentence)
#   words = sentence.split
#   first_letter = []
#   words.each do |word|
#     first_letter << word[0]
#   end
#   first_letter.join.upcase
# end

# puts acronym("National Aeronautics and Space Administration") #=> "NASA"
# puts acronym("Central Intelligence Agency") #=> "CIA"
# puts acronym("Ruby on Rails") #=> "ROR"


# Implement a Rock-Paper-Scissors game method.

def rock_paper_scissors(player1, player2)
  case [player1, player2]
  when ['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock']
    return "Player 1 wins"
  when ['rock', 'paper'], ['scissors', 'rock'], ['paper', 'scissors']
    return "Player 2 wins"
  when ['rock', 'rock'], ['scissors', 'scissors'], ['paper', 'paper']
    return "It's a draw"
  end
end
