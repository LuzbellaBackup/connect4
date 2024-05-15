# frozen_string_literal: true

# Game Class
class Game
  attr_accessor :matrix

  def initialize
    @matrix = default_matrix
    @players = []
    @grid = nil
  end

  def load_libs
    require_relative 'player'
    require_relative 'grid'
    require_relative 'logic'
  end

  def utilities
    2.times { |i| @players.push(Player.new(get_user, i)) }
    @grid = Grid.new
  end

  def default_matrix
    [
      # [nil, nil, nil, nil, nil, nil],
      %w[a b a b a b],
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

  def get_user
    puts "\tEnter your name: ...\n"
    gets
  end

  def main_loop
  end

  def main
    load_libs
    introduction
    utilities
    puts @grid.constructor(matrix)
  end
end

gam = Game.new
# gam.main

p gam.matrix[0].find_index(nil)
## Mousekiherramienta misteriosa
