require 'board.rb'
describe Board do
  subject do
    Board.new
  end

  describe '#place_piece' do
    it 'places a piece on the board' do
      subject.place_piece(2, 'x')
      expect(subject.instance_variable_get(:@locations)).to eq([1, 'x', 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#three_in_a_row' do
    context 'when there are not three in a row' do
      it 'returns false' do
        expect(subject.three_in_a_row).to eq(false)
      end
    end

    context 'When there are three in a row' do
      before do
        @board = Board.new
        @board.instance_variable_set(:@locations, ['x', 'x', 'x', 4, 5, 6, 7, 8, 9])
      end
      it 'returns true' do
        expect(@board.three_in_a_row).to eq(true)
      end
    end

    before do
      @board = Board.new
      @board.instance_variable_set(:@locations, [1, 2, 3, 'o', 'o', 'o', 7, 8, 9])
    end
    it 'returns true' do
      expect(@board.three_in_a_row).to eq(true)
    end

    before do
      @board = Board.new
      @board.instance_variable_set(:@locations, ['o', 'x', 'x', 'o', 5, 6, 'o', 8, 9])
    end
    it 'returns true' do
      expect(@board.three_in_a_row).to eq(true)
    end
  end
end
