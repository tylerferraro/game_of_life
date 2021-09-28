RSpec.describe GameOfLife::Game do
  let!(:data) {
    [
      [0, 0, 2, 2],
      [0, 0, 0, 0],
      [0, 0, 0, 2],
      [0, 0, 0, 0],
    ]
  }
  let!(:game) { described_class.new(data) }

  describe '.new' do
    it 'creates a board from the initialized data' do
      expect(game.board.to_a).to eq(data)
    end
  end

  describe '#tick' do
    before { allow(game.board).to receive(:mutate!) }

    it 'mutates the board a single tick' do
      expect(game.board).to receive(:mutate!).exactly(1).times
      game.tick
    end

    it 'mutates the board a set amount of ticks' do
      ticks = 10

      expect(game.board).to receive(:mutate!).exactly(ticks).times
      game.tick(ticks)
    end
  end
end
