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

  def show_board
    @board.display_board
  end

  def place(location)
    @board.place_piece(location, which_players_turn[:sign])
    next_turn
  end

  private

  def next_turn
    @turn += 1
  end

  def which_players_turn
    @turn.even? ? @players[:player1] : @players[:player2]
  end

  # Creates Board
  class Board
    def initialize
      @locations = []
      @locations = (0...9).map { |x| @locations[x] = x }
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
      @locations[location] = sign
      display_board
    end
  end
end
