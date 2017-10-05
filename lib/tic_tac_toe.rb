# Sets up the play field
class Game
  require 'board.rb'
  def initialize(name1 = 'Player 1', name2 = 'Player 2')
    @players = {
      player1: { name: name1, sign: 'x' },
      player2: { name: name2, sign: 'o' }
    }
    @board = Board.new
    @occupied_slots = []
    @turn = 0
  end

  def show_board
    @board.display_board
  end

  def place(location)
    @board.place_piece(location, which_players_turn[:sign])
    win? ? win_condition : next_turn
    placed_numbers(location)
  end

  def empty_place?(input)
    !@occupied_slots.include?(input)
  end

  def win?
    @board.three_in_a_row
  end

  private

  def placed_numbers(location)
    @occupied_slots.push(location)
  end

  def win_condition
    puts "Winner Winner! #{which_players_turn[:name]}!"
  end

  def next_turn
    @turn += 1
  end

  def which_players_turn
    @turn.even? ? @players[:player1] : @players[:player2]
  end
end

def scrub_name(input, player)
  input.empty? ? "Player#{player}" : input
end

def valid_number?(input)
  input.between?(1, 9)
end

def draw
  puts "It's a draw!"
end

# puts 'Tic-tac-toe, get three in a row!'
# puts "Enter Player1's name: "
# player1 = scrub_name(gets.chomp, 1)
# puts "Enter Player2's name: "
# player2 = scrub_name(gets.chomp, 2)
# puts "\n\n\n"

# game = Game.new(player1, player2)

# 9.times do |n|
#   game.show_board
#   input = gets.chomp.to_i
#   until valid_number?(input) && game.empty_place?(input)
#     if valid_number?(input)
#       puts 'Enter a number on the board'
#     elsif game.empty_place?(input)
#       puts 'Enter a valid number'
#     end
#     game.show_board
#     input = gets.chomp.to_i
#   end
#   game.place(input)
#   break if game.win?
#   draw if n == 8
# end
# game.show_board
