require 'set'

# This is a method definition called read_stop_words. It takes one argument,
# stop_words_file, which is the name of a file containing a list of stop words
# (commonly used in a language but generally doesn’t add any meaning to the text).
# def read_stop_words(stop_words_file)
#   # Inside the method, File.readlines(stop_words_file) reads each line of the file
#   # into an array of strings, and to_set converts that array into a set (as mentioned earlier).
#   # The &:chomp syntax is a shorthand for {|x| x.chomp},
#   # which calls chomp on each string in the set to remove any newline characters.
#   File.readlines(stop_words_file).to_set(&:chomp)
# end

# def count_words(file_name, stop_words)
#   word_count = Hash.new(0)
#   File.foreach(file_name) do |line|
#     line.downcase.scan(/[a-z]+/) do |word|
#       word_count[word] += 1 unless stop_words.include?(word)
#     end
#   end
#   word_count
# end

def read_stop_words(stop_words_file)
  File.readlines(stop_words_file).map(&:chomp)
end

def count_words(file_name, stop_words)
  word_count = Hash.new(0)
  stop_words = stop_words.to_set

  File.foreach(file_name) do |line|
    line.downcase.scan(/[a-z]+/) do |word|
      word_count[word] += 1 unless stop_words.include?(word)
    end
  end

  word_count
end

def sort_words_by_count(word_count)
  word_count.sort_by { |_word, count| -count }
end

def most_common_words(file_name, stop_words_file, num_words)
  stop_words = read_stop_words(stop_words_file)
  word_count = count_words(file_name, stop_words)
  sort_words_by_count(word_count).take(num_words).to_h
end


# def sort_words_by_count(word_count)
#   word_count.sort_by { |_word, count| -count }
# end

# def most_common_words(file_name, stop_words_file, num_words)
#   stop_words = read_stop_words(stop_words_file)
#   word_count = count_words(file_name, stop_words)
#   sort_words_by_count(word_count).take(num_words).to_h
# end
