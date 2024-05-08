# frozen_string_literal: true

test =
  [
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil]
  ]

class Grid
end

puts "User

┌───┬───┬───┬───┬───┬───┬───┐
└─1─┴─2─┴─3─┴─4─┴─5─┴─6─┴─7─┘
┌───┬───┬───┬───┬───┬───┬───┐
│ x │ x │ x │ x │ x │ x │ x │
├───┼───┼───┼───┼───┼───┼───┤
│ x │ x │ x │ x │ x │ x │ x │
├───┼───┼───┼───┼───┼───┼───┤
│ x │ x │ x │ x │ x │ x │ x │
├───┼───┼───┼───┼───┼───┼───┤
│ x │ x │ x │ x │ x │ x │ x │
├───┼───┼───┼───┼───┼───┼───┤
│ x │ x │ x │ x │ x │ x │ x │
├───┼───┼───┼───┼───┼───┼───┤
│ x │ x │ x │ x │ x │ x │ x │
└───┴───┴───┴───┴───┴───┴───┘

123456789012345
┌─┬─┬─┬─┬─┬─┬─┐
│x│x│x│x│x│x│x│
├─┼─┼─┼─┼─┼─┼─┤
│x│x│x│x│x│x│x│
├─┼─┼─┼─┼─┼─┼─┤
│x│x│x│x│x│x│x│
├─┼─┼─┼─┼─┼─┼─┤
│x│x│x│x│x│x│x│
├─┼─┼─┼─┼─┼─┼─┤
│x│x│x│x│x│x│x│
├─┼─┼─┼─┼─┼─┼─┤
│x│x│x│x│x│x│x│
└─┴─┴─┴─┴─┴─┴─┘
"

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
  reference = ['─', '┌', '┬', '┐', '├', '┼', '┤', '└', '┴', '┘', '|', ' ']
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

def constructor(matrix, row)
  array = []
  (matrix[0].length * 2 + 1).times do |column|
    p rel_pos(6, column)
    i = 0
    loop do
      if column.even?
        p i
        if i.even?
          array.push(char_picker(rel_pos(13, column) + 1, rel_pos(row, i)))
        else
          3.times { array.push(char_picker(0, row)) }
        end
      else
        i.even? ? array.push('│') : array.push('   ')
      end
      i += 1
      break if i == row
    end
    array.push("\n")
  end
  array.join('')
end

puts constructor(test, 15)
# array.push(" #{matrix[row/2-1][column/2-1]} ")
