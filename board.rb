# creates the playing field
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
  end

  def three_in_a_row
    matched = false
    @win_conditions.each do |line|
      matched = true if /ooo|xxx/.match?(@locations.values_at(*line).join)
      break if matched
    end
    matched
  end
  end
