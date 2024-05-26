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
    @players.each { |player| player.load_to_json }
    @grid = Grid.new
    @logic = Logic.new
  end

  def default_matrix
    [
      # %w[a a a a a a],
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

  def input_loop
    puts '// Pick a number from 1 to 8 :3'
    input = nil
    loop do
      input = gets.chomp[/\b[1-7]\b/]
      conditional = @matrix[input.to_i - 1].find_index(nil)
      break if !input.nil? && !conditional.nil?

      puts "\nBAD INPUT. please, pick a number from 1 to 8 that it's column aint full."
    end
    input.to_i - 1
  end

  def main_loop # rubocop:disable Metrics/MethodLength
    turn = 0
    loop do
      print_ui(@players[turn])
      user_input = input_loop
      height = @matrix[user_input].find_index(nil)
      @matrix[user_input][height] = @players[turn].symbol
      wc = @logic.call_winconditions(@matrix)
      break if wc # wc

      turn = 1 - turn # Alternator
    end
    @players[turn].update(true)
    @players[1 - turn].update(false)
    turn
  end

  def main
    load_libs
    introduction
    utilities
    turn = main_loop
    print_ui(@players[turn])
    puts "#{@players[turn].name_tag} has won"
  end
end
