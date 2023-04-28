# Define a method that checks if a credit card number is valid or not, with regex
# def valid_credit_card?(number)
#   number = number.to_s
#   if number =~ /\A\d{16}\z/
#     return true
#   else
#     return false
#   end
# end

# Enhance our credit card checker by implementing the Luhn algorithm.
def valid_credit_card?(number)
  # removes any non-digit characters
  number = number.to_s.gsub(/\D/, '')
  # checks if the resulting string number has a length of 16 and contains only digits, otherwise returns false
  return false unless number.length == 16 && number !~ /\D/

  # This line converts the number string into an array of integers
  # using the chars method to split the string into individual characters,
  # and the map method to convert each character to an integer using the to_i method.
  digits = number.chars.map(&:to_i)
  # This line sums the digits of the number, doubling every second digit from the right
  # and subtracting 9 if the result is greater than 9.
  # The sum is then divided by 10, and if the remainder is 0, the number is valid.
  sum = digits.each_with_index.sum do |digit, index|
    index.even? ? [digit * 2, 9].min : digit
  end
  (sum % 10).zero?
end
