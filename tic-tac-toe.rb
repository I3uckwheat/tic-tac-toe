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

class Board
  attr_accessor :locations
  def initialize
    @locations = []
    @locations = (0...9).map { |x| @locations[x] = x }
  end

  def display_board
    @locations.each_slice(3) do |x, y, z|
      printf "   #{x} | #{y} | #{z}\n"
      #puts "----------------"
    end
  end
end
