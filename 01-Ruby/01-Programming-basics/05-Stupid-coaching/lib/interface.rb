require_relative "coach_answer"

test = true

while test
  puts "What do you want to say to your coach?"
  answer = gets.chomp
  puts coach_answer_enhanced(answer)
end
