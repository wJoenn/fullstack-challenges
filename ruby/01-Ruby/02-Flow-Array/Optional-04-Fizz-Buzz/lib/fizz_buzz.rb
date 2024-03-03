def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  raise ArgumentError unless number.positive?

  (1..number).to_a.map do |e|
    if (e % 3).zero? && (e % 5).zero?
      "FizzBuzz"
    elsif (e % 5).zero?
      "Buzz"
    elsif (e % 3).zero?
      "Fizz"
    else
      e
    end
  end
end
