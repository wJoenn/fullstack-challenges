def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number.match?(/^(0|\+33 *)[1-9]([- ]*\d){8}$/)
end
