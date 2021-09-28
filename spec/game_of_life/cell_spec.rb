RSpec.describe GameOfLife::Cell do

  let!(:dead) { described_class.new(0) }
  let!(:newborn) { described_class.new(1) }
  let!(:adult) { described_class.new(2) }
  let!(:senior) { described_class.new(3) }

  describe '.new' do
    it 'defaults the age to :dead' do
      cell = described_class.new

      expect(cell.age).to eq(0)
    end

    it 'allows age to be set' do
      age = 1
      cell = described_class.new(age)

      expect(cell.age).to eq(age)
    end
  end

  describe '#mutate' do
  end

  describe '#alive?' do
    it 'returns false if cell is dead' do
      expect(dead.alive?).to be(false)
    end

    it 'returns true if cell is newborn' do
      expect(newborn.alive?).to be(true)
    end

    it 'returns true if cell is adult' do
      expect(adult.alive?).to be(true)
    end

    it 'returns true if cell is senior' do
      expect(senior.alive?).to be(true)
    end
  end

  describe '#dead?' do
    it 'returns true if cell is dead' do
      expect(dead.dead?).to be(true)
    end

    it 'returns false if cell is newborn' do
      expect(newborn.dead?).to be(false)
    end

    it 'returns false if cell is adult' do
      expect(adult.dead?).to be(false)
    end

    it 'returns false if cell is senior' do
      expect(senior.dead?).to be(false)
    end
  end

  describe '#newborn?' do
    it 'returns false if cell is dead' do
      expect(dead.newborn?).to be(false)
    end

    it 'returns true if cell is newborn' do
      expect(newborn.newborn?).to be(true)
    end

    it 'returns false if cell is adult' do
      expect(adult.newborn?).to be(false)
    end

    it 'returns false if cell is senior' do
      expect(senior.newborn?).to be(false)
    end
  end

  describe '#adult?' do
    it 'returns false if cell is dead' do
      expect(dead.adult?).to be(false)
    end

    it 'returns false if cell is newborn' do
      expect(newborn.adult?).to be(false)
    end

    it 'returns true if cell is adult' do
      expect(adult.adult?).to be(true)
    end

    it 'returns false if cell is senior' do
      expect(senior.adult?).to be(false)
    end
  end

  describe '#senior?' do
    it 'returns false if cell is dead' do
      expect(dead.senior?).to be(false)
    end

    it 'returns false if cell is newborn' do
      expect(newborn.senior?).to be(false)
    end

    it 'returns false if cell is adult' do
      expect(adult.senior?).to be(false)
    end

    it 'returns true if cell is senior' do
      expect(senior.senior?).to be(true)
    end
  end
end
