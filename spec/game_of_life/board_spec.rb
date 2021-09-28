RSpec.describe GameOfLife::Board do
  let!(:data) {
    [
      [0, 0, 0],
      [2, 2, 0],
      [0, 1, 1]
    ]
  }
  let!(:mutation) {
    [
      [1, 1, 0],
      [3, 0, 0],
      [1, 2, 2]
    ]
  }
  let!(:board) { described_class.new(data) }

  describe '.new' do
    it 'calculates the rows and columns' do
      expect(board.rows).to eq(3)
      expect(board.columns).to eq(3)
    end
  end

  describe '#mutate!' do
    it 'mutates the cells on the board' do
      board.mutate!
      expect(board.to_a).to eq(mutation)
    end
  end

  describe '#get_neighbors' do
  end

  describe '#to_a' do
    it 'returns a 2 dimensional array' do
      expect(board.to_a).to eq(data)
    end
  end
end
