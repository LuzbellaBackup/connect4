# frozen_string_literal: true

require './lib/grid'
require './spec/examples/example'

RSpec.shared_context 'values' do
  let(:white_w) { MockValues::WIN_CONDITIONS[:white_valid] }
  let(:white_f) { MockValues::WIN_CONDITIONS[:white_invalid] }
  let(:black_w) { MockValues::WIN_CONDITIONS[:black_valid] }
  let(:black_f) { MockValues::WIN_CONDITIONS[:black_invalid] }
  let(:empty) { MockValues::EXTREME_CASES[:empty] }
  let(:locked) { MockValues::EXTREME_CASES[:complete] }
end

describe Grid do
  include MockValues
  # include_context 'values'
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
        xit 'default case' do
        end
        xit 'lower left limit' do
        end
        xit 'lower right limit' do
        end
        xit 'upper left limit' do
        end
        xit 'upper right limit' do
        end
      end
      xit 'if empty return " "' do
      end
    end
    describe '#constructor' do
      xit 'default "A"' do
      end
      xit 'default "B"' do
      end
      xit 'expect empty grid' do
      end
    end
  end
end
