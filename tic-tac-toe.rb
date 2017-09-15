# Sets up the play field
class Game
  def initialize(name1, name2)
    @players = {player1: [name1, "x"], player2: [name2, "o"] }
    @board = Board.new
  end

  def show_board
    @board.display_board
  end

  def place(location)
    sign = "x"
    @board.place_piece(location, sign)
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
      puts location, sign
    end
  end
end
