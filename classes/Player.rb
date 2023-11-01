class Player
  attr_reader :name # read only because get_name handles setting
  attr_accessor :lives # read/write because other modules need to be able to do both

  def initialize
    @name = name
    @lives = 3
  end

  def get_name
    @name = gets.chomp
  end

  def lose_life
    if @lives > 0
      @lives -= 1
    end
  end
end

# Testing
# player1 = Player.new
# player2 = Player.new
# player1.get_name
# player2.get_name
# puts player1.name
# puts player2.name
# player1.lose_life
# player1.lose_life
# player1.lose_life
# player1.lose_life
# player2.lose_life
# puts player1.lives
# puts player2.lives