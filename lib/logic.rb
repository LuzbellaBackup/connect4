# frozen_string_literal: true

require './lib/math_fun'

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

        (row[column] == temporal) && !row[column].nil? ? counter(true) : counter(false)
        temporal = row[column] # this stores the last value
      end
    end
    win
  end

  def diagonal_check(matrix, symbol = 'a')
    loop do
      break if win

      @columns_revolutions += 1 if @iteration == 2 * @columns
      x_value = 0
      temporal = nil
      while x_value != @iteration
        break if win

        current_x = x_value + mod_postN(@iteration, @columns, @columns_revolutions)
        current_y = (arrI @iteration - x_value) - mod_postN(@iteration, @columns, @columns_revolutions)
        eval = limit?(@iteration, x_value, @columns, @columns_revolutions)

        if eval
          value = matrix [current_x][current_y]
          (value == temporal) && !value.nil? ? counter(true) : counter(false)
          temporal = value
        end
        x_value += 1
      end
      @iteration += 1
      break if @iteration > 12
    end
    win
  end

  def counter_diagonal_check(matrix, symbol = 'a')
    loop do
      break if win

      @columns_revolutions += 1 if @iteration == 2 * @columns
      x_value = 0
      temporal = nil
      while x_value != @iteration
        break if win

        current_x = x_value + mod_postN(@iteration, @columns, @columns_revolutions)
        current_y = (arrI @iteration - x_value) - mod_postN(@iteration, @columns, @columns_revolutions)
        eval = limit?(@iteration, x_value, @columns, @columns_revolutions, true)

        if eval
          value = matrix [-(current_x + 1)][current_y]
          (value == temporal) && !value.nil? ? counter(true) : counter(false)
          temporal = value
        end
        x_value += 1
      end
      @iteration += 1
      break if @iteration > 12
    end
    win
  end

  def call_winconditions(matrix, symbol = 'a')
    row_check(matrix, symbol = 'a')
    columns_check(matrix, symbol = 'a')
    diagonal_check(matrix, symbol = 'a')
    counter_diagonal_check(matrix, symbol = 'a')
  end
end
