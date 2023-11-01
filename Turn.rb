class Turn
  def initialize
    # this method produces an inclusive range (from 1 up to and including 20):
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = @num1 + @num2
  end

  def print_question
    puts "What does #{@num1} + #{@num2} equal?"
  end

  def correct?(answer)
    answer == @sum
  end
end

# Testing
# turn1 = Turn.new
# turn2 = Turn.new
# turn1.print_question
# turn2.print_question
# puts turn1.correct?(7)
# puts turn2.correct?(11)
