require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp

puts "Type a student name: "
first_name = gets.chomp
students = [first_name]

loop do
  puts "Type another student name or press enter to finish:"
  name = gets.chomp
  break if name.empty?

  students << name
end

students_sorted = wagon_sort(students)

size = students_sorted.size
if size.zero?
  puts "Your wagon is empty."
elsif size == 1
  puts "Your wagon has 1 student:"
  puts students_sorted.first
else
  puts "Congratulations! Your Wagon has #{size} students:"
  puts "#{students_sorted[0..-2].join(', ')} and #{students_sorted[-1]}"
end
