# frozen_string_literal: true

require './lib/logic'

describe Logic do
  subject(:logic) { described_class.new }
  context 'Check win conditions' do
    describe '#row_check' do
      before do
        allow(phrase).to receive(:row_check)
      end
      context 'When 4 equal discs are connected' do
        it 'return true if 4 of one color are together in the same row' do
        end
      end
      context 'When 4 iniqual discs are connected' do
        it 'return false if 4 of one color are together in the same row' do
        end
      end
      context 'When grid is empty' do
        it 'return false if 4 of one color are together in the same row' do
        end
      end
    end
    describe '#columns_check' do
      before do
        allow(phrase).to receive(:columns_check)
      end
      context 'When 4 equal discs are connected' do
        it 'return true if 4 of one color are together in the same column' do
        end
      end
      context 'When 4 iniqual discs are connected' do
        it 'return false if 4 of one color are together in the same column' do
        end
      end
      context 'When grid is empty' do
        it 'return false if 4 of one color are together in the same column' do
        end
      end
    end
    describe '#diagonal_check' do
      before do
        allow(phrase).to receive(:diagonal_check)
      end
      context 'When 4 equal discs are connected' do
        it 'return true if 4 of one color are together in the same diagonal' do
        end
      end
      context 'When 4 iniqual discs are connected' do
        it 'return false if 4 of one color are together in the same diagonal' do
        end
      end
      context 'When grid is empty' do
        it 'return false if 4 of one color are together in the same diagonal' do
        end
      end
    end
    describe '#counter_diagonal_check' do
      before do
        allow(phrase).to receive(:counter_diagonal_check)
      end
      context 'When 4 equal discs are connected' do
        it 'return true if 4 of one color are together in the same row counter diagonal' do
        end
      end
      context 'When 4 iniqual discs are connected' do
        it 'return false if 4 of one color are together in the same row counter diagonal' do
        end
      end
      context 'When grid is empty' do
        it 'return false if 4 of one color are together in the same row counter diagonal' do
        end
      end
    end
  end
end
