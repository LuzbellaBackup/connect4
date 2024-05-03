# frozen_string_literal: true

require './lib/logic'
require './spec/examples/example'

RSpec.shared_context 'values' do
  let(:white_w) { MockValues::WIN_CONDITIONS[:white_valid] }
  let(:white_f) { MockValues::WIN_CONDITIONS[:white_invalid] }
  let(:black_w) { MockValues::WIN_CONDITIONS[:black_valid] }
  let(:black_f) { MockValues::WIN_CONDITIONS[:black_invalid] }
  let(:empty) { MockValues::EXTREME_CASES[:empty] }
  let(:locked) { MockValues::EXTREME_CASES[:complete] }
end

describe Logic do
  include MockValues
  include_context 'values'
  subject(:logic) { described_class.new }
  context 'Check win conditions' do
    describe '#row_check' do
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same row' do
          win_condition = logic.row_check(white_w, 'a')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row' do
          win_condition = logic.row_check(white_f, 'a')
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same row' do
          win_condition = logic.row_check(black_w, 'b')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row' do
          win_condition = logic.row_check(black_f, 'b')
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.row_check(empty)
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#columns_check' do
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same column' do
          win_condition =  logic.columns_check(white_w, 'a')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same column' do
          win_condition = logic.columns_check(white_f, 'a')
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same column' do
          win_condition =  logic.columns_check(black_w, 'b')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same column' do
          win_condition = logic.columns_check(black_f, 'b')
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.columns_check(empty)
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#diagonal_check' do
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same diagonal' do
          win_condition = logic.diagonal_check(white_w, 'a')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same diagonal' do
          win_condition = logic.diagonal_check(white_f, 'a')
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same diagonal' do
          win_condition = logic.diagonal_check(black_w, 'b')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same diagonal' do
          win_condition = logic.diagonal_check(black_f, 'b')
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.diagonal_check(empty)
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#counter_diagonal_check' do
      context 'When 4 white equal discs are connected' do
        it 'return true if 4 of one color are together in the same row counter diagonal' do
          win_condition = logic.counter_diagonal_check(white_w, 'a')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 white iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row counter diagonal' do
          win_condition = logic.diagonal_check(white_f, 'a')
          expect(win_condition).to be(false)
        end
      end
      context 'When 4 black equal discs are connected' do
        it 'return true if 4 of one color are together in the same row counter diagonal' do
          win_condition = logic.diagonal_check(black_w, 'b')
          expect(win_condition).to be(true)
        end
      end
      context 'When 4 black iniqual discs are connected' do
        it 'return false if 4 of one color are not together in the same row counter diagonal' do
          win_condition = logic.diagonal_check(black_f, 'b')
          expect(win_condition).to be(false)
        end
      end
      context 'When grid is empty' do
        it 'return false' do
          win_condition = logic.diagonal_check(empty)
          expect(win_condition).to be(false)
        end
      end
    end

    describe '#call_wincondtions' do
    end
  end
end
