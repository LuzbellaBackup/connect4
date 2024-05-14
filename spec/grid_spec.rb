# frozen_string_literal: true

require './lib/grid'
require './spec/examples/example'

RSpec.shared_context 'values' do
  let(:case_a) { MockValues::EXTREME_CASES[:default] }
  let(:case_b) { MockValues::EXTREME_CASES[:default2] }
  let(:empty) { MockValues::EXTREME_CASES[:empty] }
  let(:locked) { MockValues::EXTREME_CASES[:complete] }
end

describe Grid do
  include MockValues
  include_context 'values'
  subject(:grid) { described_class.new }
  context 'Grid Functions + Grid UI' do
    describe '#rel_pos' do
      it 'return 0 at index 0' do
        expected = grid.rel_pos(5, 0)
        expect(expected).to be(0)
      end
      it 'return 1 at range 0 < x > n' do
        expected = grid.rel_pos(5, 3)
        expect(expected).to be(1)
      end
      it 'return 2 at index n' do
        expected = grid.rel_pos(5, 3)
        expect(expected).to be(1)
      end
    end
    describe '#char_picker' do
      context ' for firt row "┌, ┬, ┐" ' do
        it 'return first value at index 0' do
          expected = grid.char_picker(1, 0)
          expect(expected).to be('┌')
        end
        it 'return middle value at range 0 < x > n' do
          expected = grid.char_picker(1, 1)
          expect(expected).to be('┬')
        end
        it 'return last value at index n' do
          expected = grid.char_picker(1, 2)
          expect(expected).to be('┐')
        end
      end
      context ' for intermediates row "├, ┼, ┤" ' do
        it 'return first value at index 0' do
          expected = grid.char_picker(2, 0)
          expect(expected).to be('├')
        end
        it 'return middle value at range 0 < x > n' do
          expected = grid.char_picker(2, 1)
          expect(expected).to be('┼')
        end
        it 'return last value at index n' do
          expected = grid.char_picker(2, 2)
          expect(expected).to be('┤')
        end
      end
      context ' for last row "└, ┴, ┘" ' do
        it 'return first value at index 0' do
          expected = grid.char_picker(3, 0)
          expect(expected).to be('└')
        end
        it 'return middle value at range 0 < x > n' do
          expected = grid.char_picker(3, 1)
          expect(expected).to be('┴')
        end
        it 'return last value at index n' do
          expected = grid.char_picker(3, 2)
          expect(expected).to be('┘')
        end
      end
      it 'return ─ for empty' do
        expected = grid.char_picker(0, 0)
        expect(expected).to be('─')
      end
    end
    describe '#symbol' do
      context 'when limit cases ' do
        it 'default case' do
          expected = grid.symbol(case_a, 0, 6)
          expect(expected).to be('b')
        end
        it 'lower left limit' do
          expected = grid.symbol(case_a, 0, 11)
          expect(expected).to be('a')
        end
        it 'lower right limit' do
          expected = grid.symbol(case_a, 12, 11)
          expect(expected).to be('b')
        end
        it 'upper left limit' do
          expected = grid.symbol(case_a, 0, 0)
          expect(expected).to be('a')
        end
        it 'upper right limit' do
          expected = grid.symbol(case_a, 12, 0)
          expect(expected).to be(' ')
        end
      end
      it 'if empty return " "' do
        expected = grid.symbol(case_a, 12, 6)
        expect(expected).to be(' ')
      end
    end
    describe '#constructor' do
      it 'default "A"' do
        expected = grid.constructor(case_a, 15)
        expect(expected).to be
        '┌───┬───┬───┬───┬───┬───┬───┐\n│ a │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ b │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ a │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ b │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ a │ b │ a │ b │ a │ b │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ a │ b │ a │ b │ a │ b │ b │\n└───┴───┴───┴───┴───┴───┴───┘\n'
      end
      it 'default "B"' do
        expected = grid.constructor(case_a, 15)
        expect(expected).to be
        '┌───┬───┬───┬───┬───┬───┬───┐\n│   │   │   │   │ a │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │ b │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │ a │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │ b │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ b │ a │ b │ a │ a │ b │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│ b │ a │ b │ a │ a │ b │ a │\n└───┴───┴───┴───┴───┴───┴───┘\n'
      end
      it 'expect empty grid' do
        expected = grid.constructor(case_a, 15)
        expect(expected).to be
        '┌───┬───┬───┬───┬───┬───┬───┐\n│   │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │   │   │   │\n├───┼───┼───┼───┼───┼───┼───┤\n│   │   │   │   │   │   │   │\n└───┴───┴───┴───┴───┴───┴───┘\n'
      end
    end
  end
end
