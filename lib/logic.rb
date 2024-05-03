# frozen_string_literal: true

require './lib/math_fun'

tst = [
  ['b', 'a', 'a', 'a', nil, nil],
  ['a', nil, 'a', nil, nil, nil],
  ['a', 'a', nil, nil, nil, nil],
  ['b', nil, nil, nil, nil, nil],
  ['a', 'a', nil, nil, nil, nil],
  ['a', nil, 'a', nil, nil, nil],
  ['a', nil, nil, 'a', nil, nil]
]
valid = [
  ['a', 'a', 'a', 'a', nil, nil],
  ['a', nil, 'a', nil, nil, nil],
  ['a', 'a', nil, nil, nil, nil],
  ['a', nil, nil, nil, nil, nil],
  ['a', 'a', nil, nil, nil, nil],
  ['a', nil, 'a', nil, nil, nil],
  ['a', nil, nil, 'a', nil, nil]
]

# Game Logic
class Logic
  include MathFun
  attr_reader :rows, :columns, :iteration, :row_revolutions, :columns_revolutions, :count

  def initialize
    @rows = 7
    @columns = 6
    @iteration = 1
    @row_revolutions = 0
    @columns_revolutions = 0
    @count = 0
  end

  def win
    @count == 3
  end

  def counter(condition)
    return reset unless condition

    @count += 1
  end

  def reset
    @count = 0
  end

  def reset_revolutions
    @row_revolutions = 0
    @columns_revolutions = 0
    @iteration = 1
  end

  def x_eval(iteration, x_value, column, columns_revolutions)
    (arrI iteration - x_value) - mod_postN(iteration, column, columns_revolutions) >= 0
  end

  def y_eval(iteration, x_value, column, columns_revolutions)
    ((x_value + mod_postN(iteration, column, columns_revolutions) < 7))
  end

  def limit?(iteration, x_value, column, columns_revolutions)
    x_eval(iteration, x_value, column, columns_revolutions) && \
      y_eval(iteration, x_value, column, columns_revolutions) # multiline conditional broke appart
  end

  def row_check(matrix, symbol = 'a')
    reset
    @columns.times do |column|
      break if win

      temporal = nil
      matrix.each do |row|
        break if win

        (row[column] == temporal) && !row[column].nil? ? counter(true) : counter(false)
        temporal = row[column] # this stores the last value
      end
    end
    win
  end

  def columns_check(matrix, symbol = 'a')
    reset
    matrix.each do |row|
      break if win

      temporal = nil
      @columns.times do |column|
        break if win

        # p row[column]

        (row[column] == temporal) && !row[column].nil? ? counter(true) : counter(false)
        # p @count
        temporal = row[column] # this stores the last value
      end
    end
    win
  end

  def diagonal_check(matrix, symbol = 'a')
    loop do
      @columns_revolutions += 1 if @iteration == 2 * @columns
      x_value = 0
      while x_value != @iteration
        current_x = x_value + mod_postN(@iteration, @columns, @columns_revolutions)
        current_y = (arrI @iteration - x_value) - mod_postN(@iteration, @columns, @columns_revolutions)
        eval = limit?(@iteration, x_value, @columns, @columns_revolutions)
        p matrix [current_x][current_y] if eval
        x_value += 1
      end
      @iteration += 1
      break if @iteration > 12
    end
  end

  def counter_diagonal_check(matrix, symbol = 'a')
  end
end

prueba = Logic.new

p prueba.columns_check(valid, 'a')

p prueba.columns_check(tst, 'a')
