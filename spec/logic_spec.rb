# frozen_string_literal: true

require './lib/logic'
require './spec/examples/example'

describe Logic do
  include MockValues
  subject(:logic) { described_class.new }
  context 'Check win conditions' do
    describe '#row_check' do
      before do
        allow(logic).to receive(:row_check)
      end
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same row' do
          win_condition =  logic.row_check(MockValues::WIN_CONDITIONS[:white_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row' do
          win_condition = logic.row_check(MockValues::WIN_CONDITIONS[:white_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same row' do
          win_condition =  logic.row_check(MockValues::WIN_CONDITIONS[:black_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row' do
          win_condition = logic.row_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.row_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#columns_check' do
      before do
        allow(logic).to receive(:columns_check)
      end
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same column' do
          win_condition =  logic.columns_check(MockValues::WIN_CONDITIONS[:white_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same column' do
          win_condition = logic.columns_check(MockValues::WIN_CONDITIONS[:white_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same column' do
          win_condition =  logic.columns_check(MockValues::WIN_CONDITIONS[:black_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same column' do
          win_condition = logic.columns_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.columns_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#diagonal_check' do
      before do
        allow(logic).to receive(:diagonal_check)
      end
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same diagonal' do
          win_condition =  logic.diagonal_check(MockValues::WIN_CONDITIONS[:white_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same diagonal' do
          win_condition = logic.diagonal_check(MockValues::WIN_CONDITIONS[:white_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same diagonal' do
          win_condition =  logic.diagonal_check(MockValues::WIN_CONDITIONS[:black_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same diagonal' do
          win_condition = logic.diagonal_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.diagonal_check(MockValues::EXTREME_CASES[:empty])
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#counter_diagonal_check' do
      before do
        allow(logic).to receive(:counter_diagonal_check)
      end
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same row counter diagonal' do
          win_condition =  logic.counter_diagonal_check(MockValues::WIN_CONDITIONS[:white_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row counter diagonal' do
          win_condition = logic.diagonal_check(MockValues::WIN_CONDITIONS[:white_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same row counter diagonal' do
          win_condition =  logic.diagonal_check(MockValues::WIN_CONDITIONS[:black_valid])
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row counter diagonal' do
          win_condition = logic.diagonal_check(MockValues::WIN_CONDITIONS[:black_invalid])
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.diagonal_check(MockValues::EXTREME_CASES[:empty])
          expect(win_condition).to be(false)
        end
      end
    end
  end
end
