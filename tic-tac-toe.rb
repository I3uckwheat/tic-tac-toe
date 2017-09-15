# Creates player and assigns them either an x or an o
class Player
  @@player_number = 0
  attr_accessor :name, :piece

  def initialize(name)
    @@player_number += 1
    @name = name

    @piece = if @@player_number == 1
               'x'
             else
               'o'
             end
  end
end

# Creates Board
class Board
  attr_accessor :locations
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
