class SlotMachine
  ITEM = { joker: 25, star: 20, bell: 15, seven: 10, cherry: 5 }

  def initialize
    @score = 0
    play
  end

  def score
    hash = [@slot_one, @slot_two, @slot_three].tally
    if hash.length == 1
      @score += ITEM[hash.first[0]] * 2
    elsif hash.length == 2 && hash.keys.include?(:joker)
      @score += ITEM[hash.min_by { |_k, v| -v }[0]]
    end
    puts "---|#{@slot_one}|#{@slot_two}|#{@slot_three}|---"
    puts "Your score is #{@score}"
  end

  def play
    @slot_one = ITEM.keys.sample
    @slot_two = ITEM.keys.sample
    @slot_three = ITEM.keys.sample
    score
  end
end
