# frozen_string_literal: true

# Game Class
class Game
  attr_accessor :matrix

  def initialize
    @matrix = default_matrix
    @players = []
    @grid = nil
    @logic = nil
  end

  def load_libs
    require_relative 'player'
    require_relative 'grid'
    require_relative 'logic'
  end

  def utilities
    2.times { |i| @players.push(Player.new(get_user(i), i)) }
    @grid = Grid.new
    @logic = Logic.new
  end

  def default_matrix
    [
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ]
  end

  def introduction
    system('clear')
    puts "Welcome to 4 in a row\n\tPress any letter to start..."
    gets
  end

  def get_user(number)
    puts "\tPlayer #{number + 1} Enter your name: ...\n"
    gets.chomp
  end

  def print_ui(current)
    system('clear')
    puts "┌───┬───┬───┬───┬───┬───┬───┐\n└─1─┴─2─┴─3─┴─4─┴─5─┴─6─┴─7─┘"
    puts @grid.constructor(matrix)
    puts "└───────────────────────────┘\n #{current.name_tag}'s turn || pick from 1-7"
  end

  def user_input
    log
    gets.chomp.to_i
  end

  def main_loop
    turn = 0
    loop do
      print_ui(@players[turn])

      wc = @logic.call_winconditions(@matrix)
      turn = 1 - turn

      break if true # wc
    end
  end

  def main
    load_libs
    introduction
    utilities
    main_loop
  end
end

gam = Game.new
gam.main

# p gam.matrix[0].find_index(nil)
## Mousekiherramienta misteriosa
