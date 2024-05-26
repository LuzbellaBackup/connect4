# frozen_string_literal: true

require './lib/math_fun'

# Game Logic
class Logic
  include MathFun
  attr_reader :rows, :columns, :iteration, :row_revolutions, :columns_revolutions, :count

  # Initializes the Logic object with default settings for a 6x5 grid.
  def initialize
    @rows = 7
    @columns = 6
    @iteration = 1
    @row_revolutions = 0
    @columns_revolutions = 0
    @count = 0
  end

  # Check if the win condition (by default 3 due to being connect 4 [0,1,2,3])
  def win
    @count == 3
  end

  # Increment win counter if condition is true
  def counter(condition)
    return reset unless condition

    @count += 1
  end

  # reset the counter to 0
  def reset
    @count = 0
  end

  # reset revolutions
  def reset_revolutions
    @row_revolutions = 0
    @columns_revolutions = 0
    @iteration = 1
  end

  # Game macro logic starts on here

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

  # Win condition
  def call_winconditions(matrix, symbol = 'a')
    row = row_check(matrix, symbol = 'a')
    col = columns_check(matrix, symbol = 'a')
    diag = diagonal_check(matrix, symbol = 'a')
    counter_diag = counter_diagonal_check(matrix, symbol = 'a')
    row || col || diag || counter_diag
  end
end
