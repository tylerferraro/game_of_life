module GameOfLife
  class Board
    attr_reader :cells, :rows, :columns

    def initialize(data)
      @rows = data.length
      @columns = data[0].length
      @cells = data.flatten.map { |entry| Cell.new(entry) }
    end

    def mutate!
      # Each cell
      @cells = cells.map do |cell|
        neighbors = get_neighbors(cell)
        cell.mutate(neighbors)
      end
    end

    def get_neighbors(cell)
      []
    end

    def to_a
      cells.map(&:age).each_slice(columns).to_a
    end
  end
end
