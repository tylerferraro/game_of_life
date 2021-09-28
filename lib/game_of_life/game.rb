module GameOfLife
  class Game
    attr_reader :board

    def initialize(data)
      @board = Board.new(data)
    end

    def tick(generations = 1)
      generations.times { board.mutate! }
    end

    def to_s
      board.to_a.map do |row|
        row.map { |cell| cell }.join(' ')
      end.join("\n")
    end
  end
end
