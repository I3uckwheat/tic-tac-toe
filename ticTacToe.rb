# Sets up the play field
class Game
  def initialize(name1 = 'Player 1', name2 = 'Player 2')
    @players = {
      player1: { name: name1, sign: 'x' },
      player2: { name: name2, sign: 'o' }
    }
    @board = Board.new
    @turn = 0
  end

  def show_names
    puts @players
  end

  def show_board
    @board.display_board
  end

  def place(location)
    @board.place_piece(location, which_players_turn[:sign])
    win? ? win_condition : next_turn
  end

  private

  def win_condition
    puts "Winner Winner! #{which_players_turn[:name]}!"
  end

  def next_turn
    @turn += 1
  end

  def which_players_turn
    @turn.even? ? @players[:player1] : @players[:player2]
  end

  def win?
    @board.three_in_a_row
  end

  # Creates Board
  class Board
    def initialize
      @locations = (1..9).to_a
      @win_conditions = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]
      display_board
    end

    def display_board
      count = 0
      @locations.each_slice(3) do |x, y, z|
        printf "  #{x} | #{y} | #{z}\n"
        puts ' -----------' if count < 2
        count += 1
      end
    end

    def place_piece(location, sign)
      @locations[location - 1] = sign
      display_board
    end

    def three_in_a_row
      matched = false
      @win_conditions.each do |line|
        if /\D{3}/.match?(@locations.values_at(*line).join)
          puts 'Match'
          matched = true
        end
        return matched
      end
    end
  end
end

def scrub_name(input, player)
  input.empty? ? "Player#{player}" : input
end

def scrub_number(input)
  until input.is_a?(Numeric) && input.between?(1, 9)
    puts 'Ender a valid number between 1 and 9'
    input = gets.chomp.to_i
  end
  input
end

puts 'Tic-tac-toe, get three in a row!'
puts "Enter Player1's name: "
player1 = scrub_name(gets.chomp, 1)
puts "Enter Player2's name: "
player2 = scrub_name(gets.chomp, 2)
puts "\n\n\n"

game = Game.new(player1, player2)
9.times do
  game.place(scrub_number(gets.chomp.to_i))
end
