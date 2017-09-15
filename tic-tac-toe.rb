# Sets up the play field
class Game
  def initialize(name1, name2)
    @player1 = Player.new(name1, "x")
    @player2 = Player.new(name2, "o")
    @board = Board.new
  end

  # Creates player and assigns them either an x or an o
  class Player
    def initialize(name, sign)
      @name = name
      @sign = sign
    end

    def place(location); end
  end

  # Creates Board
  class Board
    def initialize
      @locations = []
      @locations = (0...9).map { |x| @locations[x] = ' ' }
    end

    def display_board
      count = 0
      @locations.each_slice(3) do |x, y, z|
        printf "  #{x} | #{y} | #{z}\n"
        puts ' -----------' if count < 2
        count += 1
      end
    end
  end
end
