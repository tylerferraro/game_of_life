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

  describe '#neighbors' do
    it 'returns all 3 neighboring cells of a corner cell' do
      cell = board.cell_at(0, 0)
      neighbors = board.neighbors(cell)
      expected_neighbors = [board.cell_at(0, 1), board.cell_at(1, 0), board.cell_at(1, 1)]

      expect(neighbors).to eq(expected_neighbors)
    end

    it 'returns all 5 neighboring cells of an edge cell' do
      cell = board.cell_at(1, 0)
      neighbors = board.neighbors(cell)
      expected_neighbors = [
        board.cell_at(0, 0), board.cell_at(0, 1),
        board.cell_at(1, 1),
        board.cell_at(2, 0), board.cell_at(2, 1)
      ]

      expect(neighbors).to eq(expected_neighbors)
    end

    it 'returns all 8 neighboring cells of a central cell' do
      cell = board.cell_at(1, 1)
      neighbors = board.neighbors(cell)
      expected_neighbors = board.cells.reject { |c| c == cell }

      expect(neighbors).to eq(expected_neighbors)
    end
  end

  describe '#cell_at' do
    it 'returns the cell at [row, col]' do
      expect(board.cell_at(1, 1).age).to eq(2)
      expect(board.cell_at(2, 0).age).to eq(0)
      expect(board.cell_at(2, 1).age).to eq(1)
    end
  end

  describe '#to_a' do
    it 'returns a 2 dimensional array' do
      expect(board.to_a).to eq(data)
    end
  end
end
