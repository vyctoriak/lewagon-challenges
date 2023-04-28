def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  digits = number.to_s.chars.map(&:to_i)
  products = []
  digits.each_with_index do |digit, index|
    products << digit
    products << digit * digits[index + 1] if digits[index + 1]
    products << digit * digits[index + 1] * digits[index + 2] if digits[index + 2]
  end
  products.uniq.length == products.length
end

p colorful?(263)
p colorful?(236)
