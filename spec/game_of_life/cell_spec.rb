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
    context 'dead cell' do
      # Reproduction
      it 'returns :newborn if exactly two neighbors and both are adults' do
        neighbors = [adult, adult]

        expect(dead.mutate(neighbors).age).to eq(1)
      end

      # Remains dead
      it 'returns :dead if exactly two neighbors but both are not adults' do
        neighbors = [adult, newborn]

        expect(dead.mutate(neighbors).age).to eq(0)
      end
    end

    context 'newborn cell' do
      # Growth
      it 'returns :adult if it has 2-4 alive neighbors' do
        neighbors = [newborn, adult]

        expect(newborn.mutate(neighbors).age).to eq(2)
      end

      # Isolation
      it 'returns :dead if less than 2 alive neighbors' do
        neighbors = [adult, dead]

        expect(newborn.mutate(neighbors).age).to eq(0)
      end

      # Overcrowding
      it 'returns :dead if more than 4 alive neighbors' do
        neighbors = [newborn, adult, adult, senior, senior]

        expect(newborn.mutate(neighbors).age).to eq(0)
      end
    end

    context 'adult cell' do
      # Growth
      it 'returns :senior if it has 1-2 alive neighbors' do
        neighbors = [newborn, senior]

        expect(adult.mutate(neighbors).age).to eq(3)
      end

      # Isolation
      it 'returns :dead if no alive neighbors' do
        neighbors = [dead, dead]

        expect(adult.mutate(neighbors).age).to eq(0)
      end

      # Overcrowding
      it 'returns :dead if more than 2 alive neighbors' do
        neighbors = [newborn, senior, senior]

        expect(adult.mutate(neighbors).age).to eq(0)
      end
    end

    context 'senior cell' do
      # Dies of old age
      it 'can always returns :dead' do
        expect(senior.mutate.age).to eq(0)
      end
    end
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
