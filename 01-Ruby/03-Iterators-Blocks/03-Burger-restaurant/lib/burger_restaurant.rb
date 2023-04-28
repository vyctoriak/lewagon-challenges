def burger(patty, sauce, topping)
  # TODO: code the `burger` method
  # should return an array of strings
  # should have the fixed value "bread" at the first element and the last element
  lunch = ["bread", yield(patty), sauce, topping, "bread"] if block_given?
  lunch ||= ["bread", patty, sauce, topping, "bread"]
  return lunch
end
