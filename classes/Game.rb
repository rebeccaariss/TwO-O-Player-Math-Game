require_relative "Player"
require_relative "Turn"

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1 # initializes to @player1 and then alternates
    # with the logic below
  end

  def no_winner? 
    # determines whether the game should continue running (yes while there is
    # no winner)
    @player1.lives > 0 && @player2.lives > 0
  end

  def results
    sleep 1.0
    puts "\n\n----- CURRENT SCORE: -----"
    puts "#{@player1.name}: #{@player1.lives}/3 lives"
    puts "#{@player2.name}: #{@player2.lives}/3 lives"
  end

  def begin
    # for refactor: move some of this functionality out of the "begin" function
    puts "Welcome welcome. Test your math skills with a friend! 🧮💪🤓"
    
    sleep 0.3
    puts "\nPlayer 1: What is your name?"
    @player1.get_name
    
    sleep 0.3
    puts "\nPlayer 2: What is your name?"
    @player2.get_name

    while no_winner?
      turn = Turn.new

      sleep 1.0
      puts "\n\n----- NEW TURN -----"
      
      sleep 0.3
      puts "#{@current_player.name}:"
      
      sleep 0.3
      turn.print_question

      if turn.correct?
        sleep 0.3
        puts "\nCorrect!"
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
      else
        sleep 0.3
        puts "\nIncorrect! Losing a life..."
        if @current_player == @player1
          @player1.lose_life
          @current_player = @player2
        else
          @player2.lose_life
          @current_player = @player1
        end
      end

      puts results
    end

    sleep 0.3
    puts "\n\n----- GAME OVER -----"
    sleep 0.3
    puts @player1.lives > 0 ? "#{@player1.name} wins!" : "#{@player2.name} wins!"
  end
end
