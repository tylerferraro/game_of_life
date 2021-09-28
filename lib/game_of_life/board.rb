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
        neighbors = neighbors(cell)
        cell.mutate(neighbors)
      end
    end

    def neighbors(cell)
      index = cells.index(cell)
      raise ArgumentError.new('Unable to find specified cell on board') if index.nil?

      row = (index / rows)
      col = (index % columns)

      neighbor_offsets.map do |row_offset, col_offset|
        r = row + row_offset
        c = col + col_offset

        is_inbounds?(r, c) ? cell_at(r, c) : nil
      end.compact
    end

    def cell_at(row, column)
      index = row * columns + column
      @cells[index]
    end

    def to_a
      cells.map(&:age).each_slice(columns).to_a
    end

    private

    def neighbor_offsets
      [
        [-1, -1], [-1, 0], [-1, 1],
        [ 0, -1],          [ 0, 1],
        [ 1, -1], [ 1, 0], [ 1, 1]
      ]
    end

    def is_inbounds?(row, col)
      row >= 0 &&
      row < rows &&
      col >= 0 &&
      col < columns
    end
  end
end
