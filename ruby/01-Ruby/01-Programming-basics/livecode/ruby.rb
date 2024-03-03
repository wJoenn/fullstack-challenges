require "date"

def christmas
  Date.today + 100 > Date.new(Date.today.year, 12, 25) ? year = Date.today.year + 1 : year = Date.today.year

  days = (Date.new(year, 12, 25) - (Date.today + 100)).to_i

  a = rand(1000).to_i
  a > days ? b = ["-", "/"] : b = ["+", "*"]
  c = b.sample
  def randomize(days, a, c)
    case c
    when "+"
      days - a
    when"-"
      a - days
    when "/"
      a.to_f / days
    when "*"
      days / a.to_f
    end
  end

  d = a.public_send(c, randomize(days, a, c)).round

  if days > 1
    "There are #{a} #{c} #{randomize(days, a, c).round(3)} = #{d} days left before Christmas."
  elsif days == 1
    "Christmas is tomorrow."
  else
    "Christmas is today."
  end
end

puts christmas