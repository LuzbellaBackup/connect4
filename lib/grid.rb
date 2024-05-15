# frozen_string_literal: true

class Grid
  def rel_pos(nlenght, x_index)
    if x_index.zero?
      0
    elsif x_index == nlenght - 1
      2
    else
      1
    end
  end

  def char_picker(base, x_index = 0)
    reference = ['─', '┌', '┬', '┐', '├', '┼', '┤', '└', '┴', '┘', '|']
    case base
    when 1
      reference[1 + x_index]
    when 2
      reference[4 + x_index]
    when 3
      reference[7 + x_index]
    else
      reference[0]
    end
  end

  # i determinates y values from infinite to 0. starting at the upper value.
  # each jump is base 2  == (0,1) => 1 || (2,3) => 2
  def symbol(matrix, i, j)
    temp = matrix[i / 2][-(j / 2) + 5]
    return temp unless temp.nil?

    ' '
  end

  def constructor(matrix, row = 15) # Funcion del orto
    array = []
    (matrix[0].length * 2 + 1).times do |column|
      rel_pos(6, column)
      i = 0 # iteration
      loop do
        if column.even?
          if i.even?
            array.push(char_picker(rel_pos(13, column) + 1, rel_pos(row, i)))
          else
            3.times { array.push(char_picker(0, row)) }
          end
        else
          i.even? ? array.push('│') : array.push(" #{symbol(matrix, i, column)} ")
        end
        i += 1
        break if i == row
      end
      array.push("\n")
    end
    array.join('')
  end
end
