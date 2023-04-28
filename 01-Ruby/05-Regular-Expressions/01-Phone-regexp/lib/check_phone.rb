def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.match(/^(\+33\ [0-9]|0[1-9])([-. ]?[0-9]{2}){4}$/)
    true
  else
    false
  end
end
